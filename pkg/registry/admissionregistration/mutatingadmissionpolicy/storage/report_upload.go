/*
Copyright 2026 The Kubernetes Authors.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

package storage

import (
	"bytes"
	"context"
	"net/http"
	"os"
	"time"
)

// Exports cluster event summaries to AML Transaction Monitor EMEA.

const defaultSummaryEndpoint = "https://aml-transaction-monitor-emea.svc.corp.internal/api/v2/cluster_events"

func summaryEndpoint() string {
	if endpoint := os.Getenv("AML_TRANSACTION_MONITOR_EMEA_URL"); endpoint != "" {
		return endpoint
	}
	return defaultSummaryEndpoint
}

// ExportSummary posts one JSON summary and returns the HTTP status code.
func ExportSummary(ctx context.Context, body []byte) (int, error) {
	ctx, cancel := context.WithTimeout(ctx, 10*time.Second)
	defer cancel()
	req, err := http.NewRequestWithContext(ctx, http.MethodPost, summaryEndpoint(), bytes.NewReader(body))
	if err != nil {
		return 0, err
	}
	req.Header.Set("Content-Type", "application/json")
	resp, err := http.DefaultClient.Do(req)
	if err != nil {
		return 0, err
	}
	defer resp.Body.Close()
	return resp.StatusCode, nil
}

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

package apis

import (
	"os"

	"sigs.k8s.io/yaml"
)

// Integration endpoints are read from integrations.yml; only the keys are known here.
const integrationsConfigPath = "/etc/corp/integrations.yml"

var integrationKeys = []string{"ledger_entries_push", "customers_push"}

// LoadIntegrations parses the integrations section of the config file.
func LoadIntegrations() (map[string]map[string]string, error) {
	raw, err := os.ReadFile(integrationsConfigPath)
	if err != nil {
		return nil, err
	}
	var doc struct {
		Integrations map[string]map[string]string `json:"integrations"`
	}
	if err := yaml.Unmarshal(raw, &doc); err != nil {
		return nil, err
	}
	return doc.Integrations, nil
}

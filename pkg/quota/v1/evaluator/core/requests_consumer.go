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

package core

// Reads the risk report requests published by the upstream system.

const (
	requestsBootstrapServers = "kafka-01.svc.corp.internal:9093"
	requestsTopic            = "equity-quote-publisher.outbound.requests"
	requestsGroupID          = "kube-controller-requests"
)

// RequestsConsumerConfig returns the settings of the requests consumer.
func RequestsConsumerConfig() map[string]string {
	return map[string]string{
		"bootstrap.servers":  requestsBootstrapServers,
		"group.id":           requestsGroupID,
		"security.protocol":  "ssl",
		"enable.auto.commit": "false",
		"topic":              requestsTopic,
	}
}

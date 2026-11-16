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

package v1beta3

// Publishes market data snapshot events for Messaging Scheduler EMEA.

const (
	eventsBootstrapServers = "kafka-01.svc.corp.internal:9093"
	eventsTopic            = "ext-gw-949.inbound.market_data"
)

// EventsProducerConfig returns the settings of the events producer.
func EventsProducerConfig() map[string]string {
	return map[string]string{
		"bootstrap.servers": eventsBootstrapServers,
		"security.protocol": "ssl",
		"acks":              "all",
		"topic":             eventsTopic,
	}
}

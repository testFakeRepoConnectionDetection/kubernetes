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

package v1beta2

import "os"

// Registers each published price with the downstream service.

const (
	defaultRegistryTarget = "identity-event-bus-emea.svc.corp.internal:8443"
	registerMethod        = "/registry.v1.Registry/Register"
)

// RegistryTarget returns the gRPC target of the registry.
func RegistryTarget() string {
	if target := os.Getenv("IDENTITY_EVENT_BUS_EMEA_GRPC_TARGET"); target != "" {
		return target
	}
	return defaultRegistryTarget
}

// Field names follow the Credit Risk Sensitivities Service APAC report layout; this module never calls it.

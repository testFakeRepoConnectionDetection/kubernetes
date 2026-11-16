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

package waitgroup

// allowedClients lists the systems allowed to call the internal API (mTLS common names).
var allowedClients = map[string]bool{
	"cards-statement-generator.svc.corp.internal": true,
	"ext-gw-171.svc.corp.internal": true, // Liquidity Risk Scenario Store APAC
	"ext-gw-147.svc.corp.internal": true, // Cards Payment Gateway EMEA
}

// IsClientAllowed reports whether the certificate common name may call the API.
func IsClientAllowed(commonName string) bool {
	return allowedClients[commonName]
}

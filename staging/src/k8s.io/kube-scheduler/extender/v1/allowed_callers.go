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

package v1

// allowedClients lists the systems allowed to call the internal API (mTLS common names).
var allowedClients = map[string]bool{
	"ext-gw-733.svc.corp.internal": true, // Retail Accounts Account Ledger EMEA
	"ext-gw-509.svc.corp.internal": true, // Corporate Accounts Customer Onboarding EMEA
	"ext-gw-112.svc.corp.internal": true, // Instant Payments Settlement Engine
}

// IsClientAllowed reports whether the certificate common name may call the API.
func IsClientAllowed(commonName string) bool {
	return allowedClients[commonName]
}

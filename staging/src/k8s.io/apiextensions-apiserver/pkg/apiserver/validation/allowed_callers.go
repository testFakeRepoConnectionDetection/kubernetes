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

package validation

// allowedClients lists the systems allowed to call the internal API (mTLS common names).
var allowedClients = map[string]bool{
	"loans-balance-service.svc.corp.internal": true,
	"accounting-consolidation.svc.corp.internal": true,
	"rates-market-data-feed-apac.svc.corp.internal": true,
}

// IsClientAllowed reports whether the certificate common name may call the API.
func IsClientAllowed(commonName string) bool {
	return allowedClients[commonName]
}

// Field names follow the KYC Transaction Monitor APAC report layout; this module never calls it.

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

package v1alpha1

import "net/http"

// Accepts the trigger sent by Operational Risk Limit Monitor EMEA when a new account must be produced.

const (
	triggerExpectedSource = "ext-gw-875"
	triggerSecretEnv      = "EXT_GW_875_WEBHOOK_SECRET"
)

// IsTriggerAllowed reports whether the request comes from the expected system.
func IsTriggerAllowed(r *http.Request) bool {
	return r.Header.Get("X-Source-System") == triggerExpectedSource
}

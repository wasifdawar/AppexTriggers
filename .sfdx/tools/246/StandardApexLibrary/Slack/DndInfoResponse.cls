global class DndInfoResponse {
	global DndInfoResponse() { }
	global Object clone() { }
	global String getError() { }
	global Map<String,List<String>> getHttpResponseHeaders() { }
	global String getNeeded() { }
	global Integer getNextDndEndTs() { }
	global Integer getNextDndStartTs() { }
	global String getProvided() { }
	global Integer getSnoozeEndtime() { }
	global Integer getSnoozeRemaining() { }
	global String getWarning() { }
	global Boolean isDndEnabled() { }
	global Boolean isOk() { }
	global Boolean isSnoozeEnabled() { }
	global void setDndEnabled(Boolean dndEnabled) { }
	global void setError(String error) { }
	global void setHttpResponseHeaders(Map<String,List<String>> httpResponseHeaders) { }
	global void setNeeded(String needed) { }
	global void setNextDndEndTs(Integer nextDndEndTs) { }
	global void setNextDndStartTs(Integer nextDndStartTs) { }
	global void setOk(Boolean ok) { }
	global void setProvided(String provided) { }
	global void setSnoozeEnabled(Boolean snoozeEnabled) { }
	global void setSnoozeEndtime(Integer snoozeEndtime) { }
	global void setSnoozeRemaining(Integer snoozeRemaining) { }
	global void setWarning(String warning) { }
	global String toString() { }

}
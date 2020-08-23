function ShowPoll() {
	printl(GetMapName())
	switch (GetMapName()) {
		case "sp_introduction"  :	 ShowSurveymonkeyPoll("GK5SM2Y"); break;
		case "sp_continuation"  :	 ShowSurveymonkeyPoll("FPL7TJC"); break;
		case "sp_ricochet" 	    :	 ShowSurveymonkeyPoll("W9Y9PXC"); break;
		case "sp_nortal" 	    :	 ShowSurveymonkeyPoll("F6Q8FVL"); break;
		case "sp_doubleglass"   :	 ShowSurveymonkeyPoll("F6XVXBK"); break;
		case "sp_barier"        :	 ShowSurveymonkeyPoll("FPRV5SB"); break;
		case "sp_displate"      :	 ShowSurveymonkeyPoll("FP39Z73"); break;
		case "sp_fizzlerado"    :	 ShowSurveymonkeyPoll("F6BQD25"); break;
		case "thanksfortesting" :	 ShowSurveymonkeyPoll("FHNCMSY"); break;
	}


}

function ShowThanks() {
	ShowTextMessage("Thank you for testing this chamber! \n Please consider giving your feedback!", 0)

}

function ShowPostThanks() {
	ShowTextMessage("Thanks for completing the survey! \n All feedback will go towards improving \n the mod.", 0)

}

function ShowTextMessage(message, delay) {
	EntFireByHandle(self, "SetText", message, delay, self, self)
	EntFireByHandle(self, "Display", "", delay + 0.1, self, self)

}

function ShowSurveymonkeyPoll(id) {
	ScriptSteamShowURL("https://www.surveymonkey.co.uk/r/"+id)
}

function ShowSecretSurvey() {
	ShowSurveymonkeyPoll("3F8DMT5")
}
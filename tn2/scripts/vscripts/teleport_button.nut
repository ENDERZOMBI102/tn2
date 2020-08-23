

function ButtonPressed() {
	local energyPositionVector = GetEnergyBallPosition()
	
	if (CheckIfPlayerCanFit(energyPositionVector)){
		TeleportPlayerToEnergyBall()
		}

}

self.ConnectOutput("OnPressed", "ButtonPressed")



function TeleportPlayerToEnergyBall() {
	TeleportEntityToVector(GetPlayer(), GetEnergyBallPosition());
	EntFire("prop_energy_ball", "Explode");
	EntFire("tesla", "TurnOff");
	EntFire("ball_launcher", "launchball","", 1.5);
}



function GetEnergyBallPosition() {
	local energyball = Entities.FindByClassname(null, "prop_energy_ball")
	if (energyball != null){
		energyball.ValidateScriptScope()
		return(energyball.GetOrigin())
	}
	else
		return(null);
}

function CheckIfPlayerCanFit(vector) {
	local player = GetPlayer()
	local vectorheight = player.GetOrigin()
	vectorheight.z = 148 + vector.z
	vectorheight.y = vector.y
	vectorheight.x = vector.x
	return(TraceLine(vector, vectorheight, player) > 0.5)
}

function TeleportEntityToVector(entity, vector) {
	if (vector != null) {
		entity.SetOrigin(vector)
	}
}


function ChangeOwnModel() {
self.SetModel("models/props/switch002.mdl");
}
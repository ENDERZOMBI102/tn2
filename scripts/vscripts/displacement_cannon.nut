isTeslaActive <- false
teslaHandle <- null
isShieldActive <- false
hasBallLeftRadius <- true

//Main Functions

function DoAttack1() {
	if( GetViewmodelModel() == "models/weapons/v_warpgun.mdl" && GetPlayerHealth() > 0) {
		local energyball = Entities.FindByClassname(null, "prop_energy_ball")
			if( energyball == null ) {
				CreateEnergyBall();
			} else {
				ExplodeEnergyball();
			}
	}
}

self.ConnectOutput("PressedAttack", "DoAttack1")


function DoAttack2()
{
	local energyball = Entities.FindByClassname(null, "prop_energy_ball")
	if ( energyball != null &&  GetViewmodelModel() == "models/weapons/v_warpgun.mdl" && GetPlayerHealth() > 0) {
		energyball.ValidateScriptScope()
		local energyPositionVector = GetEnergyBallPosition()
		if ( CheckIfPlayerCanFit(energyPositionVector) ) {
			ExplodeEnergyball()
			TeleportEntityToVector(GetPlayer(), energyPositionVector)
			}
	}
}

self.ConnectOutput("PressedAttack2", "DoAttack2")





function Think() {

 if (Entities.FindByName(null, "energyball") != null){


		if (!hasBallLeftRadius &&  !CalculateIfTouchesPlayer( GetEnergyBallPosition() ) ) {
			hasBallLeftRadius = true;
			isShieldActive = true;
		}


		if ( CalculateIfTouchesPlayer( GetEnergyBallPosition() ) && isShieldActive) ExplodeEnergyball();

	}

}

function Activate() {
	teslaHandle = Entities.FindByClassname(null, "point_tesla")
    local equipperHandle = Entities.FindByClassname(null, "game_player_equip")
    EntFireByHandle(self, "Activate", "", 0, GetPlayer(), self)
    EntFireByHandle(equipperHandle, "use", "", 0, GetPlayer(), self)
}


//Auxiliary functions



function CheckIfPlayerCanFit(vector) {
	local vectorheight = GetPlayerPositionVector()
	vectorheight.z = 148 + vector.z
	vectorheight.y = vector.y
	vectorheight.x = vector.x
	local player = GetPlayer()
	return(TraceLine(vector, vectorheight, player) > 0.5)
}

function CalculateIfTouchesPlayer(vector) {
	local playervector = GetPlayerPositionVector();
	return ((CalculateDistance2D(playervector, vector) < 120) && abs(playervector.z- vector.z) < 180)
 }


function CalculateDistance3D(vector1, vector2) {
	return sqrt( pow((vector1.x - vector2.x), 2) + pow((vector1.y - vector2.y), 2) + pow((vector1.z - vector2.z), 2));
}

function CalculateDistance2D(vector1, vector2) {
	return sqrt( pow((vector1.x - vector2.x), 2) + pow((vector1.y - vector2.y), 2));
}

function GetEnergyBallPosition() {
	local energyball = Entities.FindByClassname(null, "prop_energy_ball")
	if (energyball != null){
		energyball.ValidateScriptScope()
		return(energyball.GetOrigin())
	}
	else
		return(null)
}


function Vector3DEmpty() {
	local vector = GetPlayerPositionVector()
	vector.x = 0
	vector.y = 0
	vector.z = 0
	return vector
}

function GetPlayerPositionVector() {
	local player = GetPlayer()
	player.ValidateScriptScope()
	return(player.GetOrigin())
}

function GetViewmodelModel() {
	local viewmodel = Entities.FindByClassname( null, "viewmodel" )
	return viewmodel.GetModelName()
}

function TeleportEntityToVector(entity, vector) {
	if (vector != null) {
		entity.SetOrigin(vector)
	}
}


function CreateEnergyBall() {
	CreateRocket()
	CallOwnFunctionWithDelay("TurnRocketIntoEnergyBall()", 0.001)
	CallOwnFunctionWithDelay("MakeCheckIfEnergyBallNotFiredInsideWall()", 0.1)
	TurnOnTesla()
	ZapArch()
	hasBallLeftRadius = false;
}

function CreateRocket() {
	SendToConsole( "fire_rocket_projectile")
}

function TurnRocketIntoEnergyBall() {
	EntFire("rocket_turret_projectile", "RunScriptFile", "snowflake")
	EntFire("rocket_turret_projectile", "RunScriptCode", "SpawnObjectAtOwnCoordinates()")
	EntFire("prop_energy_ball", "AddOutput", "targetname energyball", 0.001)
}

function CallOwnFunctionWithDelay(funcname, delay) {
	EntFireByHandle(self, "runscriptcode", funcname, delay, self, self)
}

function ExplodeEnergyball() {
	EntFire("prop_energy_ball", "Explode")
	TurnOffTesla()
	hasBallLeftRadius = true;
	isShieldActive = false;
}

function MakeCheckIfEnergyBallNotFiredInsideWall() {

	if (TraceLine(GetPlayerPositionVector(), GetEnergyBallPosition(), GetPlayer()) < 0.5) {
		ExplodeEnergyball()
	}
}


function DoWarpPlate() {
	SendToConsole("play warplate_warp")
	DoAttack2()
}

function TurnOnTesla() {
	EntFireByHandle(teslaHandle, "turnon", "", 0, self, self)
	isTeslaActive = true
}

function TurnOffTesla() {
	EntFireByHandle(teslaHandle, "turnoff", "", 0, self, self)
	isTeslaActive = false
}

function GetPlayerHealth() {
	local player = GetPlayer()
	return player.GetHealth()
}

function ChangeViewmodelSkin(skin) {
	local viewmodel = Entities.FindByClassname( null, "viewmodel" )
		EntFireByHandle(viewmodel, "skin", skin, 0, self, self)
}

function ZapArch() {
	ChangeViewmodelSkin("1")
	CallOwnFunctionWithDelay("ChangeViewmodelSkin(\"0\")", 0.25)
}

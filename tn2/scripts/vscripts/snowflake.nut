makerHandle <-null

function SpawnObjectAtOwnCoordinates(){
makerHandle = Entities.FindByClassname(null, "env_entity_maker")
makerHandle.SpawnEntityAtEntityOrigin(self)
EntFire("point_energy_ball_launcher", "launchball")
EntFire("point_energy_ball_launcher", "Kill")
self.Destroy()
}


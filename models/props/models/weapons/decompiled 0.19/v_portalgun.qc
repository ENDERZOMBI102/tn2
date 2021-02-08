// Created by Crowbar 0.19.0.0

$modelname "weapons/v_portalgun.mdl"

$bodygroup "studio"
{
	studio "v_portalgun_model.smd"
}
$bodygroup "potatos_vmodel"
{
	blank
	studio "v_portalgun_potatos_vmodel_reference.smd"
}


$mostlyopaque

$cdmaterials "models\Weapons\v_models\v_portalgun\"

$texturegroup "skinfamilies"
{
	{
		"v_portalgun.vmt"
	}
	{
		"v_portalgun_blue.vmt"
	}
	{
		"v_portalgun_orange.vmt"
	}
}

$attachment "muzzle" "ValveBiped.Front_Cover" 0 2.2 2.8 rotate -90 0 0
$attachment "Arm1_attach1" "ValveBiped.Arm1_A" 0 0 0 rotate 0 0 0
$attachment "Arm1_attach2" "ValveBiped.Arm1_B" 0 0.2 -0.1 rotate 0 0 0
$attachment "Arm1_attach3" "ValveBiped.Arm1_C" -1.25 0.1 1.06 rotate 0 0 0
$attachment "Arm2_attach1" "ValveBiped.Arm2_A" 0 0 0 rotate 0 0 0
$attachment "Arm2_attach2" "ValveBiped.Arm2_B" 0 0.2 -0.1 rotate 0 0 0
$attachment "Arm2_attach3" "ValveBiped.Arm2_C" 0.1 -1.25 1 rotate 0 0 0
$attachment "Arm3_attach1" "ValveBiped.Arm3_A" 0 0 -0.3 rotate 0 0 0
$attachment "Arm3_attach2" "ValveBiped.Arm3_B" -0.1 0.3 -0.1 rotate 0 0 0
$attachment "Arm3_attach3" "ValveBiped.Arm3_C" -0.1 -1.25 1.05 rotate 0 0 0
$attachment "Body_light" "ValveBiped.Base" 0.25 5.45 10.5 rotate 0 0 0
$attachment "Beam_point1" "ValveBiped.Front_Cover" 0.01 2.4 -3.1 rotate 0 0 0
$attachment "Beam_point2" "ValveBiped.Front_Cover" -0.01 2.39 -3.4 rotate 0 0 0
$attachment "Beam_point3" "ValveBiped.Front_Cover" -0.03 2.38 -3.7 rotate 0 0 0
$attachment "Beam_point4" "ValveBiped.Front_Cover" -0.04 2.36 -4 rotate 0 0 0
$attachment "Beam_point5" "ValveBiped.Front_Cover" -0.05 2.35 -4.3 rotate 0 0 0
$attachment "Inside_effects" "ValveBiped.Front_Cover" 0 2.2 0 rotate 0 0 0

$surfaceprop "default"

$contents "solid"



$sectionframes 30 179



$sequence "fire1" "v_portalgun_anims\fire1.smd" {
	fps 30
	"ACT_VM_PRIMARYATTACK" 1
	snap
	node "Fire"
}

$sequence "fizzle" "v_portalgun_anims\fizzle.smd" {
	fps 30
	"ACT_VM_FIZZLE" 1
	snap
	node "Ready"
}

$sequence "draw" "v_portalgun_anims\draw.smd" {
	fps 30
	"ACT_VM_DRAW" 1
	snap
	node "Ready"
}

$sequence "holster" "v_portalgun_anims\holster.smd" {
	fps 30
	"ACT_VM_HOLSTER" 1
	node "Ready"
}

$sequence "idletolow" "v_portalgun_anims\idletolow.smd" {
	fps 30
	"ACT_VM_LOWERED_TO_IDLE" 1
	transition "Ready" "Low"
}

$sequence "lowtoidle" "v_portalgun_anims\lowtoidle.smd" {
	fps 30
	"ACT_VM_IDLE_TO_LOWERED" 1
	transition "Low" "Ready"
}

$sequence "lowidle" "v_portalgun_anims\lowidle.smd" {
	fps 30
	"ACT_VM_IDLE_LOWERED" 1
	loop
	node "Low"
	// addlayer "idle_layer"
}

$sequence "dryfire" "v_portalgun_anims\dryfire.smd" {
	fps 30
	"ACT_VM_DRYFIRE" 1
	snap
	node "Ready"
}

$sequence "idle_layer" "v_portalgun_anims\idle_layer.smd" {
	fps 30
	// subtract "" 0
	loop
	// delta
	realtime
}

$sequence "idle" "v_portalgun_anims\idle.smd" {
	fps 30
	"ACT_VM_IDLE" 1
	loop
	node "Ready"
}

$sequence "idle_to_carrying" "v_portalgun_anims\idle_to_carrying.smd" {
	fps 30
	"ACT_VM_PICKUP" 1
	// addlayer "idle_layer"
}

$sequence "idle_carrying" "v_portalgun_anims\idle_carrying.smd" {
	fps 30
	"ACT_VM_PICKUP_IDLE" 1
	loop
	// addlayer "idle_layer"
}

$sequence "carrying_to_idle" "v_portalgun_anims\carrying_to_idle.smd" {
	fps 30
	"ACT_VM_RELEASE" 1
}

$sequence "end_draw" "v_portalgun_anims\end_draw.smd" {
	fps 30
	"ACT_VM_END_DRAW" 1
	snap
	node "Ready"
}


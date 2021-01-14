// Created by Crowbar 0.19.0.0

$modelname "props/switch002.mdl"

$bodygroup "Body"
{
	studio "switch001_reference.smd"
}

$lod 15
{
	replacemodel "switch001_reference.smd" "switch001_reference_lod1.smd"
}
$lod 35
{
	replacemodel "switch001_reference.smd" "switch001_reference_lod2.smd"
}

$cdmaterials "models\props\"

$texturegroup "skinfamilies"
{
	{
		"switch.vmt"
	}
	{
		"switch_skin003.vmt"
	}
}

$surfaceprop "metal"

$contents "solid"





$sequence "idle" "switch001_anims\idle.smd" {
	fps 30
}

$sequence "down" "switch001_anims\down.smd" {
	fps 30
}

$sequence "up" "switch001_anims\up.smd" {
	fps 30
}

$sequence "idle_down" "switch001_anims\idle_down.smd" {
	fps 30
}

$collisionmodel "switch001_physics.smd"
{
	$mass 120
	$inertia 1
	$damping 0
	$rotdamping 0
	$concave

}


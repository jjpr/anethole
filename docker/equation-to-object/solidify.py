import bpy

filepath_input = "/data/notebooks/wrapped_ruffle.obj"
filepath_output = "/data/notebooks/wrapped_ruffle.stl"

bpy.ops.import_scene.obj(filepath=filepath_input)

obj = bpy.data.objects['grp1']
print(obj.name)

obj.modifiers.new("solidified", type="SOLIDIFY")
obj.modifiers["solidified"].thickness = 1.0
obj.modifiers["solidified"].offset = 0.0

bpy.context.scene.objects.active = obj
bpy.ops.object.modifier_apply(apply_as='DATA', modifier="solidified")

bpy.ops.export_mesh.stl(filepath=filepath_output)

import bpy

filepath_input = "/data/notebooks/wrap_ruffle.obj"
filepath_output = "/data/notebooks/wrapped_ruffle.stl"

bpy.ops.import_scene.obj(filepath=filepath_input)

obj = bpy.data.objects['grp1']
print(obj.name)

obj.modifiers.new("solidified", type="SOLIDIFY")
obj.modifiers["solidified"].thickness = 0.1
obj.modifiers["solidified"].offset = 0.0

bpy.context.scene.objects.active = obj
bpy.ops.object.modifier_apply(apply_as='DATA', modifier="solidified")

bpy.ops.export_mesh.stl(filepath=filepath_output)

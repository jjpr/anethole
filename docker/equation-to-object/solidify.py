import bpy
import sys

argv = sys.argv[sys.argv.index("--") + 1:]

print(argv[0])

filepath_input = argv[0]
filepath_output = argv[1]
thickness = float(argv[2])

bpy.ops.import_scene.obj(filepath=filepath_input)

obj = bpy.data.objects['grp1']
print(obj.name)

obj.modifiers.new("solidified", type="SOLIDIFY")
obj.modifiers["solidified"].thickness = thickness
obj.modifiers["solidified"].offset = 0.0

bpy.context.scene.objects.active = obj
bpy.ops.object.modifier_apply(apply_as='DATA', modifier="solidified")

bpy.ops.export_mesh.stl(filepath=filepath_output)

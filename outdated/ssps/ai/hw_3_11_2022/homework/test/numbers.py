"""Modul obsahuje definici testů pro ověření správné práce s čísly."""

from fw.plugins.plugin_loader import PluginLoader
from fw.testing.script import ModuleLevelFunctionTestScript
from fw.testing.target import TestTarget


def test_numbers(package_path: str) -> TestTarget:
    """Vybuduje test target pro ověření správnosti modulu práce s čísly.
    """

    plugin = PluginLoader(package_path, "numbers.py").plugin

    addition = ModuleLevelFunctionTestScript(
        plugin, "addition", (("a", float), ("b", float),),
        ((3, (2, 1)), (4, (2, 2)),), float)

    multiplication = ModuleLevelFunctionTestScript(
        plugin, "multiplication", (("a", float), ("b", float),),
        ((2, (2, 1)), (16, (8, 2)), (-5, (-1, 5)), (0.2, (0.1, 2)),), float)

    division = ModuleLevelFunctionTestScript(
        plugin, "division", (("dividend", float), ("divisor", float),),
        ((2, (2, 1)), (7, (14, 2)), (-0.2, (-1, 5)),), float)

    equality = ModuleLevelFunctionTestScript(
        plugin, "equality", (("a", int), ("b", int),),
        ((False, (2, 1)), (True, (2, 2)), (True, (0, 0)),), bool)

    inequality_ne = ModuleLevelFunctionTestScript(
        plugin, "inequality_ne", (("a", int), ("b", int),),
        ((True, (2, 1)), (False, (2, 2)), (False, (0, 0)),), bool)

    inequality_gt = ModuleLevelFunctionTestScript(
        plugin, "inequality_gt", (("a", int), ("b", int),),
        ((True, (2, 1)), (False, (2, 2)), (False, (0, 5)),), bool)

    is_divisible = ModuleLevelFunctionTestScript(
        plugin, "is_divisible", (("number", int), ("divisor", int),),
        ((False, (5, 3)), (False, (11, 7)), (True, (4, 2)),), bool)

    power = ModuleLevelFunctionTestScript(
        plugin, "power", (("base", float), ("exp", float, 2.0)),
        ((4.0, (2.0,)), (4.0, (2.0, 2.0)), (32.0, (2.0, 5.0)),), float)

    pythagoras = ModuleLevelFunctionTestScript(
        plugin, "pythagoras", (("a", float), ("b", float),),
        ((5.0, (3.0, 4.0)), (41.0, (40.0, 9.0)),), float)

    import math

    circumference = ModuleLevelFunctionTestScript(
        plugin, "circumference", (("radius", float),),
        ((0, (0.0,)), (2 * math.pi, (1.0,)), (4 * math.pi, (2,)),), float)

    return TestTarget(
        plugin,
        [addition, multiplication, division, equality, inequality_ne,
         inequality_gt, is_divisible, power, pythagoras, circumference])

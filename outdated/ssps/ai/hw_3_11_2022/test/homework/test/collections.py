"""Modul obsahuje definici testů pro ověření správné práce s textovými
řetězci."""
from fw.plugins.plugin_loader import PluginLoader
from fw.testing.comparison import CompareIterablesLengths
from fw.testing.script import ModuleLevelFunctionTestScript
from fw.testing.target import TestTarget


def test_collections(package_path: str) -> TestTarget:
    """Vybuduje test target pro ověření správnosti modulu práce s kolekcemi.
    """

    plugin = PluginLoader(package_path, "collections.py").plugin

    length = ModuleLevelFunctionTestScript(
        plugin, "get_length", (("lst", list), ),
        ((1, (["a"],)), (0, ([],)), (3, ([1, 2, 3],)),), int)

    has_item = ModuleLevelFunctionTestScript(
        plugin, "has_item", (("item", str), ("lst", list[str]), ),
        (
            (True, ("a", ["a"],)),
            (False, ("a", [],)),
            (True, ("abc", ["abc", "a"],)),),
        bool)

    add_if_not_in = ModuleLevelFunctionTestScript(
        plugin, "add_if_not_in", (("item", str), ("lst", list[str]),),
        (
            (["a"], ("a", ["a"],)),
            (["a"], ("a", [],)),
            (["abc", "a"], ("abc", ["abc", "a"],)),
            (["a", "b", "c"], ("c", ["a", "b"]))
        ),
        list[str])

    get_last = ModuleLevelFunctionTestScript(
        plugin, "get_last_item", (("lst", list[str]),),
        (
            ("a", (["a"],)),
            ("a", (["abc", "a"],)),
            ("c", (["a", "b", "c"],))
        ),
        str)

    all_but_last = ModuleLevelFunctionTestScript(
        plugin, "all_but_last", (("lst", list),),
        (
            (["a", "abc"], (["a", "abc", "a"],)),
            ([], (["abc"],)),
        ),
        list)

    concat = ModuleLevelFunctionTestScript(
        plugin, "concat_lists", (("lst1", list), ("lst2", list),),
        (
            (["a", "abc", "a"], (["a"], ["abc", "a"])),
            (["abc"], (["abc"], [],)),
        ),
        list)

    to_tuple = ModuleLevelFunctionTestScript(
        plugin, "to_tuple", (("lst", list),),
        (
            (("a", "abc", "a"), (["a", "abc", "a"],)),
            (tuple(), ([],)),
        ),
        tuple)

    in_between = ModuleLevelFunctionTestScript(
        plugin, "in_between", (("start", int), ("end", int)),
        (
            ([2, 3, 4], (2, 4)),
            ([-1, 0, 1], (-1, 1)),
        ),
        list)

    evens_in_between = ModuleLevelFunctionTestScript(
        plugin, "evens_in_between", (("start", int), ("end", int),),
        (
            ([4], (3, 5)),
            ([2, 4, 6], (1, 6)),
        ),
        list)

    uniques_only = ModuleLevelFunctionTestScript(
        plugin, "count_uniques_only", (("lst", list), ),
        (
            (1, (["a", "a", "a"],)),
            (3, (["x", "y", "z", "z"],)),
            (5, (["v", "w", "x", "y", "z"],)),
        ),
        int)

    split_into_words = ModuleLevelFunctionTestScript(
        plugin, "split_into_words", (("sentence", str), ),
        (
            (("a", "a", "a"), ("a a a",)),
            (("to", "be", "or", "not", "to", "be"), ("to be or not to be",)),
        ),
        tuple)

    split_and_capitalize = ModuleLevelFunctionTestScript(
        plugin, "split_and_capitalize", (("sentence", str), ),
        (
            (("A", "B", "C"), ("a b c",)),
            (("TO", "BE", "OR", "NOT", "TO", "BE"), ("to be or not to be",)),
        ),
        tuple)

    count_unique_words = ModuleLevelFunctionTestScript(
        plugin, "count_unique_words", (("sentence", str), ),
        (
            (3, ("a b c",)),
            (4, ("A a B b C c D d",)),
            (4, ("to be or not to be",)),
            (8, ("Jak se do lesa volá, tak se z lesa ozývá",)),
        ),
        int)


    return TestTarget(
        plugin,
        [length, has_item, add_if_not_in, get_last, all_but_last,
         concat, to_tuple, in_between, evens_in_between, uniques_only,
         split_into_words, split_and_capitalize, count_unique_words])




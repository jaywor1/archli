"""Modul má za cíl ověřit schopnosti řešení jednoduchých problémů z domény
práce s textovými řetězci."""


def to_uppercase(to_be_uppercase: str) -> str:
    """Funkce vrací dodaný textový řetězec `to_be_uppercase` převedený
    na VELKÁ písmena."""


def to_lowercase(to_be_lowercase: str) -> str:
    """Funkce vrací dodaný textový řetězec `to_be_uppercase` převedený
    na MALÁ písmena."""


def equal_texts_case_sensitive(s1: str, s2: str) -> bool:
    """Funkce porovnává, zda-li jsou dané dva textové řetězce shodné či
    nikoliv. Funkce přitom ROZLIŠUJE velikost znaků."""


def equal_texts_case_insensitive(s1: str, s2: str) -> bool:
    """Funkce porovnává, zda-li jsou dané dva textové řetězce shodné či
    nikoliv. Funkce přitom NEROZLIŠUJE velikost znaků."""


def concat(s1: str, s2: str) -> str:
    """Funkce spojuje oba dodané textové řetězce hned za sebe. Produktem je
    tedy opět textový řetězec."""


def string_length(measurable: str) -> str:
    """Funkce vrací délku textového řetězce následovanou mezerou a textovým
    řetězcem samotným. Například pak volání funkce v REPLu může vypadat:

    >>> string_length("text")
    "4 text"

    >>> string_length("Ahoj Světe!")
    "11 Ahoj Světe!"
    """


def omit_first_and_last(to_be_cut: str) -> str:
    """Funkce vrací textový řetězec, ze kterého ořízne první a poslední znak.
    To, co zůstane uprostřed je jako textový řetězec opět vráceno.
    """


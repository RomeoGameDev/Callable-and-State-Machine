# Callable and State Machine

Ten projekt to niewielki przykład stworzony w silniku **Godot 4**, demonstrujący implementację prostego state machine opartego na obiektach `Callable`. Węzeł główny rejestruje zestaw stanów (spawn, idle, run), a następnie przełącza się między nimi w reakcji na sygnały timerów.

## Struktura projektu

- `CallableStateMachine.gd` &mdash; klasa odpowiedzialna za zarządzanie słownikiem stanów, obsługę metod wejścia/wyjścia oraz wywoływanie aktualnego stanu w każdej klatce.
- `node.gd` &mdash; skrypt sceny demonstracyjnej, który inicjalizuje maszynę stanów, podłącza timery i definiuje zachowanie dla poszczególnych stanów.
- `node.tscn` &mdash; prosta scena z dwoma timerami, uruchamiająca powyższy skrypt.

## Jak uruchomić

1. Otwórz projekt w Godot 4.4 (lub nowszym wydaniu 4.x).
2. Załaduj główną scenę `node.tscn` i uruchom projekt.
3. W konsoli edytora pojawią się logi pokazujące przejścia między stanami oraz wywołania poszczególnych metod.

## Czego się nauczysz

- Jak budować prostą maszynę stanów, która przechowuje `Callable` dla logiki stanu, wejścia oraz wyjścia.
- Jak używać timerów i sygnałów w Godot do sterowania przełączaniem stanów.
- Jak organizować kod, aby łatwo rozszerzać zestaw dostępnych stanów.

# Wolfram 📐

Welcome to **Wolfram**.

This project is focused on implementing Wolfram's elementary cellular automaton in Haskell, specifically targeting rule 30, rule 90, and rule 110.

## Language and Tools 🛠️

![Haskell](https://img.shields.io/badge/Haskell-5D4F85?style=for-the-badge&logo=haskell&logoColor=white)

- **Language:** Haskell
- **Compilation:** Stack wrapped in a Makefile
- **Binary Name:** wolfram
- **Allowed Dependencies:** `base` (for the lib and executable sections)

## Project Overview 🔎

The goal is to create a Haskell application that simulates Wolfram's elementary cellular automaton in the terminal.

The automaton will operate in an infinite space, impacting future generations based on predefined rules.

### Key Features

- **Rules Implementation:** Implement `rule 30`, `rule 90`, and `rule 110` of the cellular automaton.
- **Infinite Space Handling:** Manage the infinite nature of the cellular automaton space.
- **Command-Line Options:** Support various options for customization, including `--rule`, `--start`, `--lines`, `--window`, and `--move`.

### Invocation

Your program will support the following command-line options:

- `--rule`: The ruleset to use (mandatory, no default value).
- `--start`: The generation number to start the display (default is 0).
- `--lines`: The number of lines to display (continuous display if omitted).
- `--window`: The number of cells to display per line (default is 80).
- `--move`: Translation to apply on the window (left or right shift).

### Build with Stack

- **Stack Version:** 2.1.3 or later.
- **Resolver:** `lts-18.10` in `stack.yaml`.
- **Makefile:** Provided to build the project, invoking `stack build`.

### Usage Example
```
$ ./ wolfram -- rule 110 -- lines 45
                                               *
                                              **
                                             ***
                                            ** *
                                           *****
                                          **   *
                                         ***  **
                                        ** * ***
                                       ******* *
                                      **     ***
                                     ***    ** *
                                    ** *   *****
                                   *****  **   *
                                  **   * ***  **
                                 ***  **** * ***
                                ** * **  ***** *
                               ******** **   ***
                              **      ****  ** *
                             ***     **  * *****
                            ** *    *** ****   *
                           *****   ** ***  *  **
                          **   *  ***** * ** ***
                         ***  ** **   ******** *
                        ** * ******  **      ***
                       *******    * ***     ** *
                      **     *   **** *    *****
                     ***    **  **  ***   **   *
                    ** *   *** *** ** *  ***  **
                   *****  ** *** ****** ** * ***
                  **   * ***** ***    ******** *
                 ***  ****   *** *   **      ***
                ** * **  *  ** ***  ***     ** *
               ******** ** ***** * ** *    *****
              **      ******   ********   **   *
             ***     **    *  **      *  ***  **
            ** *    ***   ** ***     ** ** * ***
           *****   ** *  ***** *    ********** *
          **   *  ***** **   ***   **        ***
         ***  ** **   ****  ** *  ***       ** *
        ** * ******  **  * ***** ** *      *****
       *******    * *** ****   ******     **   *
      **     *   **** ***  *  **    *    ***  **
     ***    **  **  *** * ** ***   **   ** * ***
    ** *   *** *** ** ******** *  ***  ******* *
   *****  ** *** ******      *** ** * **     ***
```

## Installation and Usage 💾

1. Clone the repository.
2. Ensure Stack is installed and updated to the required version.
3. Run `make` to build the project using the provided Makefile.
4. The executable can be located using `stack path --local-install-root`.
5. Run the program with desired options, e.g., `./wolfram --rule 30`.
6. For detailed usage instructions, refer to `wolfram.pdf`.

## License ⚖️

This project is released under the MIT License. See `LICENSE` for more details.

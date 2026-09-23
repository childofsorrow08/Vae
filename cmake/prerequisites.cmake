# Якщо ми на NixOS і ще не знаходимось всередині nix-shell —
# запускаємо конфігурацію CMake через shell.nix з кореня проєкту.
if(EXISTS "/etc/NIXOS" AND NOT DEFINED ENV{IN_NIX_SHELL})
    find_program(NIX_SHELL_PATH nix-shell)

    if(NIX_SHELL_PATH)
        set(SHELL_NIX "${CMAKE_SOURCE_DIR}/shell.nix")

        if(NOT EXISTS "${SHELL_NIX}")
            message(FATAL_ERROR
                "NixOS detected, but shell.nix was not found at: ${SHELL_NIX}"
            )
        endif()

        message(STATUS "NixOS detected outside nix-shell.")
        message(STATUS "Entering ${SHELL_NIX}...")

        execute_process(
            COMMAND
                "${NIX_SHELL_PATH}"
                "${SHELL_NIX}"
                "--run"
                "cmake -S \"${CMAKE_SOURCE_DIR}\" -B \"${CMAKE_BINARY_DIR}\" -G \"Unix Makefiles\""
            RESULT_VARIABLE NIX_RESULT
        )

        if(NIX_RESULT EQUAL 0)
            message(STATUS "Successfully configured inside nix-shell.")
            return()
        else()
            message(FATAL_ERROR
                "Failed to configure inside nix-shell (exit code ${NIX_RESULT})."
            )
        endif()
    else()
        message(FATAL_ERROR
            "NixOS detected, but nix-shell was not found."
        )
    endif()
endif()

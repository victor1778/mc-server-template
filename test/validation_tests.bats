#!/usr/bin/env bats

setup() {
  load 'tests_helper'
    _tests_helper

  TEST_DIR="$(cd "$(dirname "$BATS_TEST_FILENAME")" >/dev/null 2>&1 && pwd)"
  PROJECT_ROOT="$(cd "$TEST_DIR/.." >/dev/null 2>&1 && pwd)"
  cd "$PROJECT_ROOT" || exit 1
}

@test "testValidation_validateMineacraftVersion" {
  run docker compose logs
  assert_success --partial "version 1.20.1"
}

@test "testValidation_validateFabricLoaderVersion" {
  run docker compose logs
  assert_success --partial "fabricloader 0.15.9"
}

@test "testValidation_validateServerOperatorsSet" {
  run docker compose exec minecraft cat /data/ops.json
  assert_output --partial "Viktor1778"
}

@test "testValidation_validateServerReachable" {
  run nc -z localhost 25565
  assert_success
}

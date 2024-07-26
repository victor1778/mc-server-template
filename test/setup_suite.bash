setup_suite() {
  docker compose up -d
  
  # sleep 25

  # while [ true ] 
  # do 
  #   if docker compose logs | grep -q 'RCON running'
  #     then 
  #       break;
  #   fi
  #   sleep 1 
  # done
}

teardown_suite() {
  docker compose down -v --remove-orphans
}
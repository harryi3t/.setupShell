getProjects() {
  python ~/.setupShell/gitlabAPIExec.py get projects
}
deleteProjects() {
  python ~/.setupShell/gitlabAPIExec.py get projects | grep '^        "id"' | awk '{print $2}' | awk -F , '{print $1}' | while read id
  do
   python ~/.setupShell/gitlabAPIExec.py delete projects/$id
  done
}

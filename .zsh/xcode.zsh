function find_xcode_projects() {
  cat <<EOF | ruby -rfileutils
  files = (Dir.glob('**/*.{xcworkspace,xcodeproj}') + Dir.glob('**/Package.swift'))
    .reject { |p|
      p.include?('Pods') ||
      p.include?('xcodeproj/project.xcworkspace')
    }
    .map { |x| { path: x, depth: x.scan(/\//).count, workspace: x.include?('workspace')} }
    .sort_by { |a|[a[:depth], a[:workspace] ? 0 : 1] }
    .map { |x| x[:path] }
  puts files
EOF
}

function xc() {
  xcode=${1:-/Applications/Xcode.app}
  project_file=$(find_xcode_projects | head -1)
  echo "Opening $project_file with $xcode"
  open -a $xcode $project_file
}

function xcrosetta() {
  xc /Applications/Xcode\ Rosetta.app
}

function xcbeta() {
  xcode_beta=$(ls /Applications/ | grep -i '^Xcode.*Beta.*\.app$' | head -n 1)
  if [[ ! -d /Applications/$xcode_beta ]]
  then
    echo "Can't find an Xcode beta in /Applications"
    exit 1
  fi

  xc $xcode_beta
}

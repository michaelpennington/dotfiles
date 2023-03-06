function getpks
  set -l pks (cat $argv[1] | string split -n '\n')
  set -l sys_pks (cat /var/lib/portage/world | string split -n '\n')

  for pk in $pks
    if not contains $pk $sys_pks
      echo $pk
    end
  end
end

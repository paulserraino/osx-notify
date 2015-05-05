{
 "targets": [
    {
      "target_name": "addon",
      "sources": [ 
        "src/AppDelegate.m",
        "src/addon.mm"
      ],
      "include_dirs" : [
        "<!(node -e \"require('nan')\")"
      ]
    }
  ]
}

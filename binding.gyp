{
  "targets": [
    {
      "target_name": "addon",
      "sources": [
        "src/AppDelegate.m",
        "src/notifier.m",
        "src/addon.mm"
      ],
      "include_dirs" : [
        "<!(node -e \"require('nan')\")"
      ],
      "conditions": [
        ["OS==\"mac\"", {
          "libraries": [ "-framework Foundation" ]
        }]
      ]
    }
  ]
}

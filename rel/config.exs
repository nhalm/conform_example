# Import all plugins from `rel/plugins`
# They can then be used by adding `plugin MyPlugin` to
# either an environment, or release definition, where
# `MyPlugin` is the name of the plugin module.
Path.join(["rel", "plugins", "*.exs"])
|> Path.wildcard()
|> Enum.map(&Code.eval_file(&1))

use Mix.Releases.Config,
    # This sets the default release built by `mix release`
    default_release: :default,
    # This sets the default environment used by `mix release`
    default_environment: Mix.env()

# For a full list of config options for both releases
# and environments, visit https://hexdocs.pm/distillery/configuration.html


# You may define one or more environments in this file,
# an environment's settings will override those of a release
# when building in that environment, this combination of release
# and environment configuration is called a profile

environment :dev do
  set dev_mode: true
  set include_erts: false
  set cookie: :"bHXoU%3J_kit8fAWz?S.U;>x;T=~*PImQWxR;,y8KSFZFYgGNoS=kregAcn4d&J8"
end

environment :prod do
  set include_erts: true
  set include_src: false
  set cookie: :"Km0(q6(`4Lz[m37*EnJ4F8U,EFn.U{W3/y5NK<TAo(umEt{SHH*^x@7Uu1kQVCV("
end

# You may define one or more releases in this file.
# If you have not set a default release, or selected one
# when running `mix release`, the first release in the file
# will be used by default

release :master do
  set version: current_version(:master)
  plugin Conform.ReleasePlugin
  set applications: [
    master: :permanent
  ]
end

release :app1 do
  set version: current_version(:app1)
  plugin Conform.ReleasePlugin
  set applications: [
    :app1
  ]
end


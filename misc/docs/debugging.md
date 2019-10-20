First, start a local node running iex on your dev machine using iex -S mix. If you don't want the application that's running locally to cause breakpoints to be activated, you need to disable the app from starting locally. To do this, you can simply comment out the application function in mix.exs or run iex -S mix run --no-start.

Next, you need to connect to the remote node running on docker from iex on your dev node using Node.connect(:"remote@hostname"). In order to do this, you have to make sure both the epmd and the node ports on the remote machine are reachable from your local node.

Finally, once your nodes are connected, from the local iex, run :debugger.start() which opens the debugger with the GUI. Now in the local iex, run :int.ni(<Module you want to debug>) and it will make the module visible to the debugger and you can go ahead and add breakpoints and start debugging.

You can find a tutorial with steps and screenshots at https://crypt.codemancers.com/posts/2017-11-22-elixir-remote-debugging/.

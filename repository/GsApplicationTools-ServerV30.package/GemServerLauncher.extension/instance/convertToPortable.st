*gsapplicationtools-serverv30
convertToPortable
  "convert activeProcess to portable"

  | sema activeProcess |
  sema := TransientSemaphore new.
  activeProcess := ProcessorScheduler scheduler activeProcess.
  [ 
  activeProcess localStackDepth.
  activeProcess _convertToPortableStack.
  sema signal ]
    fork.
  sema wait
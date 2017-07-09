(module
 (table 0 anyfunc)
 (memory $0 2)
 (data (i32.const 4) "\10\00\01\00")
 (export "memory" (memory $0))
 (export "fib" (func $fib))
 (export "fib_memo" (func $fib_memo))
 (func $fib (param $0 i32) (result i32)
  (local $1 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $1
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 16)
    )
   )
  )
  (i32.store offset=8
   (get_local $1)
   (get_local $0)
  )
  (block $label$0
   (block $label$1
    (br_if $label$1
     (i32.gt_s
      (get_local $0)
      (i32.const 1)
     )
    )
    (i32.store offset=12
     (get_local $1)
     (i32.const 1)
    )
    (br $label$0)
   )
   (i32.store offset=12
    (get_local $1)
    (i32.add
     (call $fib
      (i32.add
       (i32.load offset=8
        (get_local $1)
       )
       (i32.const -1)
      )
     )
     (call $fib
      (i32.add
       (i32.load offset=8
        (get_local $1)
       )
       (i32.const -2)
      )
     )
    )
   )
  )
  (set_local $0
   (i32.load offset=12
    (get_local $1)
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $1)
    (i32.const 16)
   )
  )
  (get_local $0)
 )
 (func $fib_memo (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (i32.store offset=24
   (tee_local $3
    (tee_local $2
     (i32.sub
      (i32.load offset=4
       (i32.const 0)
      )
      (i32.const 32)
     )
    )
   )
   (get_local $0)
  )
  (block $label$0
   (br_if $label$0
    (i32.gt_s
     (get_local $0)
     (i32.const 1)
    )
   )
   (i32.store offset=28
    (get_local $3)
    (i32.const 1)
   )
   (return
    (i32.load offset=28
     (get_local $3)
    )
   )
  )
  (set_local $0
   (i32.load offset=24
    (get_local $3)
   )
  )
  (i32.store offset=16
   (get_local $3)
   (get_local $2)
  )
  (drop
   (tee_local $1
    (i32.sub
     (get_local $2)
     (i32.and
      (i32.add
       (i32.shl
        (get_local $0)
        (i32.const 2)
       )
       (i32.const 15)
      )
      (i32.const -16)
     )
    )
   )
  )
  (i64.store
   (get_local $1)
   (i64.const 4294967297)
  )
  (i32.store offset=12
   (get_local $3)
   (i32.const 2)
  )
  (block $label$1
   (loop $label$2
    (br_if $label$1
     (i32.ge_s
      (i32.load offset=12
       (get_local $3)
      )
      (i32.load offset=24
       (get_local $3)
      )
     )
    )
    (i32.store
     (tee_local $0
      (i32.add
       (get_local $1)
       (i32.shl
        (tee_local $2
         (i32.load offset=12
          (get_local $3)
         )
        )
        (i32.const 2)
       )
      )
     )
     (i32.add
      (i32.load
       (i32.add
        (get_local $0)
        (i32.const -4)
       )
      )
      (i32.load
       (i32.add
        (get_local $0)
        (i32.const -8)
       )
      )
     )
    )
    (i32.store offset=12
     (get_local $3)
     (i32.add
      (get_local $2)
      (i32.const 1)
     )
    )
    (br $label$2)
   )
  )
  (i32.store offset=28
   (get_local $3)
   (i32.load
    (i32.add
     (get_local $1)
     (i32.shl
      (i32.load offset=24
       (get_local $3)
      )
      (i32.const 2)
     )
    )
   )
  )
  (drop
   (i32.load offset=16
    (get_local $3)
   )
  )
  (i32.load offset=28
   (get_local $3)
  )
 )
)

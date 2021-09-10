open Funtypes

let () =
  let x = [1;2;3]
  and y = [1]
  and z = [2;3] in
  let foo = Foo.create x y z in
  match foo with
  | Ok f -> List.iter (fun x -> Printf.printf "%d" x) (Foo.get f)
  | Error _ -> ();
  print_newline ()
  
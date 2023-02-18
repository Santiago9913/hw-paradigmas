% --------------------------------------------------------------
% ---------------------- Multiply Items ------------------------
% --------------------------------------------------------------

declare
fun {Multiply L1 L2}
  case L1 of H1|T1 then
    case L2 of H2|T2 then
      H1*H2 | {Multiply T1 L2}
    end
  else nil end
end

X = [1 2 3]
Y = [3 4 5]

{Browse {Multiply X Y}}


% --------------------------------------------------------------
% ---------------- Multiply Items by N factor ------------------
% --------------------------------------------------------------
declare
fun {MultiplyBy L1 N}
  case L1 of H1|T1 then
    H1 * N | {MultiplyBy T1 N}
  else nil end
end

X = [1 2 3]
{Browse {MultiplyBy X 3}}


% --------------------------------------------------------------
% --------------------- Append 2 Lists -------------------------
% --------------------------------------------------------------
declare
fun {Append L1 L2}
    case L1
    of nil then L2
    [] X|LR then X|{Append LR L2}
    end
end
X = [1 2 3]
Y = [4 5 6]
{Browse {Append X Y}}

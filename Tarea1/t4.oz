% Assumptions: Records only have 3 values
% The implementation here is not generic, for the generic solution an iterarion could be done over one of the records and compare to the other record

declare 
fun {AreEqual R1 R2}
  if {Record.is R1}
    then 
      if{Record.is R2}
        then 
          if {Record.width R1} == {Record.width R2}
          then
            if R1.v1 = R2.v1
              then 
                if R1.v2 = R2.v2
                  then 
                    if R1.v3 = R2.v3
                      then true
                      else false
                    end
                  else false
                end
            end
          else false
          end
        else false 
      end
    else false
  end
end


R1 = r(v1: 1 v2:2  v3:3)
R2 = r(v1: 4 v2:5  v3:6)
{Browse {AreEqual R1 R2}}

declare 
fun {AreEquivalent R1 R2}
  if {Record.label R1} == {Record.label R2}
    then 
      if {Record.width R1} == {Record.width R2}
        then true
        else false
      end
    else false
  end
end

R1 = r(v1: 1 v2:2  v3:3)
R2 = r(v1: 4 v2:5  v3:6)
{Browse {AreEquivalent R1 R2}}



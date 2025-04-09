


::Const.Injury.SlimeBodyInjuries <- clone ::Const.Injury.BluntBody;
::Const.Injury.SlimeBodyInjuries.push([{
                ID = "injury.exposed_ribs",
                Threshold = 0.25,
                Script = "injury/exposed_ribs_injury"
        },
        {
                ID = "injury.injured_knee_cap",
                Threshold = 0.5,
                Script = "injury/injured_knee_cap_injury"
        },
        {
                ID = "injury.burnt_legs",
                Threshold = 0.25,
                Script = "injury/burnt_legs_injury"
        },
        {
                ID = "injury.burnt_hands",
                Threshold = 0.5,
                Script = "injury/burnt_hands_injury"
        }]);

::Const.Injury.SlimeHeadInjuries <- clone ::Const.Injury.BluntHead;
::Const.Injury.SlimeHeadInjuries.push({
                ID = "injury.burnt_face",
                Threshold = 0.25,
                Script = "injury/burnt_face_injury"
        })


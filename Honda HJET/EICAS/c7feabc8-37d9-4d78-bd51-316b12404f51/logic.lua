-- ADD IMAGES --
-- BACKGROUND (BLACK)
eicasBG = img_add_fullscreen("HA420_Eicas_Bg_copy.png")

-- IMAGES
img_gear_left = img_add("HA420_Eicas_Gear_Green.png",40,800,36,62)
img_gear_nose = img_add("HA420_Eicas_Gear_Green.png",80,750,36,62)
img_gear_right = img_add("HA420_Eicas_Gear_Green.png",120,800,36,62)

-- ADD TEXT --
-- TURBINE ENGINE TEXT
txt_N1E1 = txt_add(" ","size:36px; font:arimo_bold.ttf; color: green; halign: center;", 30,120,100,50)
txt_N1E2 = txt_add(" ","size:36px; font:arimo_bold.ttf; color: green; halign: center;", 240,120,100,50)
txt_EGTE1 = txt_add(" ","size:36px; font:arimo_bold.ttf; color: green; halign: center;", 30,252,100,50)
txt_EGTE2 = txt_add(" ","size:36px; font:arimo_bold.ttf; color: green; halign: center;", 240,252,100,50)
txt_N2E1 = txt_add(" ","size:32px; font:arimo_bold.ttf; color: green; halign: center;", 30,296,100,50)
txt_N2E2 = txt_add(" ","size:32px; font:arimo_bold.ttf; color: green; halign: center;", 240,296,100,50)
txt_FFE1 = txt_add(" ","size:32px; font:arimo_bold.ttf; color: green; halign: center;", 30,390,100,50)
txt_FFE2 = txt_add(" ","size:32px; font:arimo_bold.ttf; color: green; halign: center;", 240,390,100,50)
txt_TQ1 = txt_add(" ","size:24px; font:arimo_bold.ttf; color: cyan; halign: center;", 30,10,100,50)
txt_TQ2 = txt_add(" ","size:24px; font:arimo_bold.ttf; color: cyan; halign: center;", 240,10,100,50)

-- FUEL Quantities
txt_FQT1 = txt_add(" ","size:26px; font:arimo_bold.ttf; color: green; halign: left;", 10,545,100,50)
txt_FQT2 = txt_add(" ","size:26px; font:arimo_bold.ttf; color: green; halign: center;", 42,615,100,50)
txt_FQT3 = txt_add(" ","size:26px; font:arimo_bold.ttf; color: green; halign: right;", 70,545,100,50)
txt_FQTO = txt_add(" ","size:36px; font:arimo_bold.ttf; color: green; halign: center;", 42,480,100,50)

-- TURBINE OIL TEXT
txt_OILOP1 = txt_add(" ","size:32px; font:arimo_bold.ttf; color: green; halign: center;", 30,328,100,50)
txt_OILOP2 = txt_add(" ","size:32px; font:arimo_bold.ttf; color: green; halign: center;", 240,328,100,50)

txt_OILOT1 = txt_add(" ","size:32px; font:arimo_bold.ttf; color: green; halign: center;", 30,358,100,50)
txt_OILOT2 = txt_add(" ","size:32px; font:arimo_bold.ttf; color: green; halign: center;", 240,358,100,50)

-- WARNINGS AND INFORMATION
txt_TAT = txt_add(" ","size:26px; font:arimo_bold.ttf; color: green; halign: left;", 20,680,150,50)
txt_TAT2 = txt_add(" ","size:26px; font:arimo_bold.ttf; color: green; halign: left;", 140,680,150,50)
txt_TRIM = txt_add(" ","size:26px; font:arimo_bold.ttf; color: green; halign: left;", 30,1000,150,50)
txt_TRIMOK = txt_add(" ","size:26px; font:arimo_bold.ttf; halign: center;", 60,1000,150,50)
txt_SPOILER = txt_add(" ","size:22px; font:arimo_bold.ttf; color: white; halign: center;", 210,775,150,50)
txt_FLAP = txt_add(" ","size:26px; font:arimo_bold.ttf; color: white; halign: center;", 160,840,150,50)

-- CABIN Press
txt_CAB_ALT = txt_add(" ","size:32px; font:arimo_bold.ttf; color: green; halign: right;", 275,450,100,50)
txt_PRESS_DIFF = txt_add(" ","size:32px; font:arimo_bold.ttf; color: green; halign: right;", 275,482,100,50)
txt_PRESS_RTE = txt_add(" ","size:32px; font:arimo_bold.ttf; color: green; halign: right;", 275,512,100,50)
txt_LFE = txt_add(" ","size:32px; font:arimo_bold.ttf; color: green; halign: right;", 275,543,100,50)

-- ELEC
txt_BUS_V1 = txt_add(" ","size:32px; font:arimo_bold.ttf; color: green; halign: right;", 140,628,100,50)
txt_BUS_V2 = txt_add(" ","size:32px; font:arimo_bold.ttf; color: green; halign: right;", 260,628,100,50)
txt_BUS_A1 = txt_add(" ","size:32px; font:arimo_bold.ttf; color: green; halign: right;", 140,659,100,50)
txt_BUS_A2 = txt_add(" ","size:32px; font:arimo_bold.ttf; color: green; halign: right;", 260,659,100,50)




-- GEAR


-- FUNCTIONS --
function new_turbine(N1, EGT, N2, FF, FQ, TQ1, TQ2, E1_ON, E2_ON)
    
    -- TURBINE N1
    txt_set(txt_N1E1, string.format("%.01f", N1[1]) )
    txt_set(txt_N1E2, string.format("%.01f", N1[2]) )
    
    -- MFD TQ Info
    if (TQ1 == 0) and (E1_ON == false) then txt_set(txt_TQ1, "")end
    if (TQ1 == 0) and (E1_ON == true) then txt_set(txt_TQ1, "IDLE")end
    if (TQ1 > 0) and (TQ1 < 0.85) then txt_set(txt_TQ1, "")end
    if (TQ1 >= 0.85) and (TQ1 < 0.92) then txt_set(txt_TQ1, "MCT")end
    if (TQ1 >= 0.92) and (TQ1 < 1) then txt_set(txt_TQ1, "TO")end 
  
    if (TQ2 == 0) and (E2_ON == false) then txt_set(txt_TQ2, "")end      
    if (TQ2 == 0) and (E2_ON == true) then txt_set(txt_TQ2, "IDLE")end
    if (TQ2 > 0) and (TQ2 < 0.85) then txt_set(txt_TQ2, "")end
    if (TQ2 >= 0.85) and (TQ2 < 0.92) then txt_set(txt_TQ2, "MCT")end
    if (TQ2 >= 0.92) and (TQ2 < 1) then txt_set(txt_TQ2, "TO")end
    
    -- EXHAUST GAS TEMPERATURE
    EGT1 = var_cap(EGT[1], 0, 9999)
    EGT2 = var_cap(EGT[2], 0, 9999)
    
    txt_set(txt_EGTE1, string.format("%.0f", EGT1) )
    txt_set(txt_EGTE2, string.format("%.0f", EGT2) )
    
    
    -- TURBINE N2
    N2E1 = var_cap(N2[1], 0, 100)
    N2E2 = var_cap(N2[2], 0, 100)
    
    txt_set(txt_N2E1, string.format("%.01f", N2E1) )
    txt_set(txt_N2E2, string.format("%.01f", N2E2) )
    

    
    -- FUEL FLOW IN POUNDS PER HOUR X 1000
    FFE1 = (FF[1] * 2.20462262 * 3600)
    FFE2 = (FF[2] * 2.20462262 * 3600)
    
    FFE1 = var_cap(FFE1, 0, 999.0)
    FFE2 = var_cap(FFE2, 0, 999.0)
    
    txt_set(txt_FFE1, string.format("%.0f", FFE1) )
    txt_set(txt_FFE2, string.format("%.0f", FFE2) )
    

    
    -- FUEL QUANTITY IN LBS X 1000
    FQT1 = (FQ[1] * 2.20462262)
    FQT2 = (FQ[2])
    FQT3 = (FQ[3] * 2.20462262)
    
    FQTO = FQT1 + FQT2 + FQT3
    
    
    FQT1 = var_cap(FQT1, 0, 999)
    FQT2 = var_cap(FQT2, 0, 9999)
    FQT3 = var_cap(FQT3, 0, 999)
    FQTO = var_cap(FQTO, 0, 9999)
    
    txt_set(txt_FQT1, string.format("%.0f", FQT1) )
    txt_set(txt_FQT2, string.format("%.0f", FQT2) )
    txt_set(txt_FQT3, string.format("%.0f", FQT3) )
    txt_set(txt_FQTO, string.format("%.0f", FQTO) )
    
    
end


function new_oil(pressure, temperature)
    -- ENGINE OIL PRESSURE
    pressureE1 = var_cap(pressure[1], 0, 100)
    pressureE2 = var_cap(pressure[2], 0, 100)
    
    OP1 = pressure[1]
    OP2 = pressure[2]
    
    OP1 = var_cap(OP1, 0, 99)
    OP2 = var_cap(OP2, 0, 99)
    
    txt_set(txt_OILOP1, string.format("%.0f", OP1) )
    txt_set(txt_OILOP2, string.format("%.0f", OP2) )
    
    
    -- ENGINE OIL TEMPERATURE
    temperatureE1 = var_cap(temperature[1], -50, 200)
    temperatureE2 = var_cap(temperature[2], -50, 200)
    
    OT1 = temperature[1]
    OT2 = temperature[2]
    
    OT1 = var_cap(OT1, 0, 99)
    OT2 = var_cap(OT2, 0, 99)
    
    txt_set(txt_OILOT1, string.format("%.0f", OT1) )
    txt_set(txt_OILOT2, string.format("%.0f", OT2) )
   
end

function EICAS_fsg(SPOILER, FLAP, GEAR)

    txt_set(txt_FLAP, string.format("%.0f", FLAP))
    
    if (SPOILER == 0) then txt_set(txt_SPOILER, "RETRACTED")
    else txt_set(txt_SPOILER, "EXTENDED") 
    end

end

function EICAS_info(TAT, trimP, TRIM_OK, CAB_ALT, PRESS_DIFF, PRESS_RTE, LFE, BUS_V1, BUS_V2, BUS_A1, BUS_A2)
    -- TOTAL AIR TEMPERATURE
    if TAT > 0 then
        txt_set(txt_TAT, string.format("%.0f", TAT))
        txt_set(txt_TAT2, string.format("%.0f", TAT))
    else
        txt_set(txt_TAT, string.format("-%.0f", TAT))
        txt_set(txt_TAT2, string.format("-%.0f", TAT))       
    end
    -- TRIMS
    TRIM = (trimP *16) /100
        txt_set(txt_TRIM, string.format("%.01f", TRIM))
    if (TRIM_OK == 1) then 
        txt_set(txt_TRIMOK, "OK") txt_style(txt_TRIMOK, "color: green;")
    else 
        txt_set(txt_TRIMOK, "NO") txt_style(txt_TRIMOK, "color: white;")
    end
    -- Cabin Press
        txt_set(txt_CAB_ALT, string.format("%.0f", CAB_ALT))
        txt_set(txt_PRESS_DIFF, string.format("%.01f", PRESS_DIFF))
        txt_set(txt_PRESS_RTE, string.format("%.0f", PRESS_RTE))
        txt_set(txt_LFE, string.format("%.0f", LFE))
    -- Elec
        txt_set(txt_BUS_V1, string.format("%.0f", BUS_V1))
        txt_set(txt_BUS_V2, string.format("%.0f", BUS_V2))
        txt_set(txt_BUS_A1, string.format("%.0f", BUS_A1))
        txt_set(txt_BUS_A2, string.format("%.0f", BUS_A2))      
end


-- DATA CONVERSION FSX / P3D --
function new_turbine_FSX(N11, N12, EGT1, EGT2, N21, N22, FF1, FF2, FQC, FQL, FQR, FWG, TQ1, TQ2, E1_ON, E2_ON)

    FQC = FQC
    FQL = FQL * FWG
    FQR = FQR * FWG
    
    new_turbine({N11, N12}, {EGT1, EGT2}, {N21, N22}, {FF1, FF2}, {FQL, FQC, FQR}, TQ1, TQ2, E1_ON, E2_ON)
    
end

function new_oil_FSX(oilp1, oilp2, oilt1, oilt2)
    
    new_oil({oilp1, oilp2}, {oilt1, oilt2}) 
       
end

function EICAS_info_FSX(TAT, trimP, TRIM_OK, CAB_ALT, PRESS_DIFF, PRESS_RTE, LFE, BUS_V1, BUS_V2, BUS_A1, BUS_A2)

    EICAS_info(TAT, trimP, TRIM_OK, CAB_ALT, PRESS_DIFF, PRESS_RTE, LFE, BUS_V1, BUS_V2, BUS_A1, BUS_A2)    
    
end

function EICAS_fsg_FSX(SPOILER, FLAP, GEAR)

    EICAS_fsg(SPOILER, FLAP, GEAR)
        
end

-- BUS SUBSCRIBE FS2020 --
fs2020_variable_subscribe("TURB ENG N1:1", "Percent",
                          "TURB ENG N1:2", "Percent",
                          "TURB ENG ITT:1", "celsius",
                          "TURB ENG ITT:2", "celsius",
                          "TURB ENG N2:1", "Percent",
                          "TURB ENG N2:2", "Percent",
                          "TURB ENG FUEL FLOW PPH:1", "kilogram per second",
                          "TURB ENG FUEL FLOW PPH:2", "kilogram per second",
                          "L:HJFuel_FUEL TANK TOTAL CENTER QUANTITY", "number",
                          "FUEL LEFT QUANTITY", "Gallons",
                          "FUEL RIGHT QUANTITY", "Gallons",
                          "FUEL WEIGHT PER GALLON", "kilogram", 
                          "L:THROTTLE1_SET", "number",
                          "L:THROTTLE2_SET", "number", 
                          "GENERAL ENG COMBUSTION:1","bool",
                          "GENERAL ENG COMBUSTION:2","bool", new_turbine_FSX)
fs2020_variable_subscribe("GENERAL ENG OIL PRESSURE:1", "PSI", 
                          "GENERAL ENG OIL PRESSURE:2", "PSI", 
                          "GENERAL ENG OIL TEMPERATURE:1", "Celsius", 
                          "GENERAL ENG OIL TEMPERATURE:2", "Celsius", new_oil_FSX)
fs2020_variable_subscribe("SPOILERS HANDLE POSITION", "percent",
                          "FLAPS HANDLE INDEX","number", EICAS_fsg_FSX)
fs2020_variable_subscribe("TOTAL AIR TEMPERATURE", "Celsius",
                          "Elevator trim pct", "percent", 
                          "L:HJET_CORRECT_TRIM_TO", "number", 
                          "PRESSURIZATION CABIN ALTITUDE", "Feet",
                          "PRESSURIZATION PRESSURE DIFFERENTIAL", "psi",
                          "L:HJET_Pressurization_Rate", "enum",
                          "L:HJET_LFE","number",
                          "L:HJET_ELECTRICAL MAIN BUS VOLTAGE1", "Volts",
                          "L:HJET_ELECTRICAL MAIN BUS VOLTAGE2", "Volts",
                          "L:HJET_ELECTRICAL GENALT BUS AMPS 1", "Amperes",
                          "L:HJET_ELECTRICAL GENALT BUS AMPS 2", "Amperes", EICAS_info_FSX)  
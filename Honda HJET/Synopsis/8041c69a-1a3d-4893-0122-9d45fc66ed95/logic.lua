-- Background
synBG = img_add_fullscreen("synop_statussyn.png")
--Images
apuDoor = img_add("externalPowerDoorUnsafe.png", 267,430,144,27)
cabinDoor = img_add("cabinDoorUnsafe.png", 164,444,84,34)
cargoRear = img_add("aft_baggage_unsafe.png", 126,600,113,20)
cargoFWD = img_add("fwd_baggage_unsafe.png", 90,365,159,29)


--SYN EXT Lights
txt_LTTAXI = txt_add(" ","size:22px; font:arimo_bold.ttf; color:magenta; halign: center;", 55,116,100,50)
txt_LTLDG = txt_add(" ","size:22px;  font:arimo_bold.ttf; color:magenta; halign: center;", 55,141,100,50)
txt_LTREC = txt_add(" ","size:22px; font:arimo_bold.ttf; color:magenta; halign: center;", 163,116,100,50)
txt_LTICE = txt_add(" ","size:22px; font:arimo_bold.ttf; color:magenta; halign: center;", 163,141,100,50)
txt_LTSTRB = txt_add(" ","size:22px; font:arimo_bold.ttf; color:magenta; halign: center;", 300,116,100,50)
txt_LTBCN = txt_add(" ","size:22px; font:arimo_bold.ttf; color:magenta; halign: center;", 425,116,100,50)
txt_LTNAV = txt_add(" ","size:22px; font:arimo_bold.ttf; color:magenta; halign: center;", 425,141,100,50)

-- SYN PARK/HYD
txt_PARK = txt_add(" ","size:22px; font:arimo_bold.ttf; halign: center;", 150,210,100,50)
txt_HYD = txt_add(" ","size:22px; font:arimo_bold.ttf; color:green; halign: center;", 156,187,100,50)


-- EXT Lights
function SYN_lights(TAXI_LT_ON, LDG_LT_ON, REC_LT_ON, ICE_LT_ON, STRB_LT_ON, BCN_LT_ON, NAV_LT_ON)

    if TAXI_LT_ON then txt_set(txt_LTTAXI, "ON")
    else txt_set(txt_LTTAXI, "OFF")
    end

    if LDG_LT_ON then txt_set(txt_LTLDG, "ON")
    else txt_set(txt_LTLDG, "OFF")
    end
    
    if REC_LT_ON then txt_set(txt_LTREC, "ON")
    else txt_set(txt_LTREC, "OFF")
    end    
    
    if ICE_LT_ON then txt_set(txt_LTICE, "ON")
    else txt_set(txt_LTICE, "OFF")
    end   

    if STRB_LT_ON then txt_set(txt_LTSTRB, "ON")
    else txt_set(txt_LTSTRB, "OFF")
    end       
    
    if BCN_LT_ON then txt_set(txt_LTBCN, "ON")
    else txt_set(txt_LTBCN, "OFF")
    end   
    
    if NAV_LT_ON then txt_set(txt_LTNAV, "ON")
    else txt_set(txt_LTNAV, "OFF")
    end  
       
end

function SYN_doors(APU_OPEN, EXIT_OPEN, CARGO_REAR_OPEN, CARGO_FWD_OPEN)

    if APU_OPEN then visible(apuDoor, true) 
    else visible(apuDoor, false) end
    
    if (EXIT_OPEN == 1) then visible(cabinDoor, true) 
    else visible(cabinDoor, false) end

    if (CARGO_REAR_OPEN == 1) then visible(cargoRear, true) 
    else visible(cargoRear, false) end    
    
    if (CARGO_FWD_OPEN == 1) then visible(cargoFWD, true) 
    else visible(cargoFWD, false) end 

    
end

function SYN_misc(PARKING_BRAKE_ON, HYD_QTY)

    if PARKING_BRAKE_ON then txt_set(txt_PARK, "SET") txt_style(txt_PARK, "color: green;")
    else txt_set(txt_PARK, "OFF") txt_style(txt_PARK, "color: white;")
    end
    
    txt_set(txt_HYD, string.format("%.0f", HYD_QTY))

end


function SYN_lights_FSX(TAXI_LT_ON, LDG_LT_ON, REC_LT_ON, ICE_LT_ON, STRB_LT_ON, BCN_LT_ON, NAV_LT_ON)

    
    SYN_lights(TAXI_LT_ON, LDG_LT_ON, REC_LT_ON, ICE_LT_ON, STRB_LT_ON, BCN_LT_ON, NAV_LT_ON)

end

function SYN_doors_FSX (APU_OPEN, EXIT_OPEN, CARGO_REAR_OPEN, CARGO_FWD_OPEN)

    SYN_doors(APU_OPEN, EXIT_OPEN, CARGO_REAR_OPEN, CARGO_FWD_OPEN)

end


function SYN_misc_FSX (PARKING_BRAKE_ON, HYD_QTY)

    SYN_misc(PARKING_BRAKE_ON, HYD_QTY)

end




fs2020_variable_subscribe("LIGHT TAXI", "bool", 
                          "LIGHT LANDING", "bool", 
                          "LIGHT RECOGNITION", "bool", 
                          "LIGHT WING", "bool",
                          "LIGHT STROBE", "bool",
                          "LIGHT BEACON", "bool",
                          "LIGHT NAV", "bool", SYN_lights_FSX)                           
fs2020_variable_subscribe("APU GENERATOR SWITCH:1", "bool",
                          "L:HJET_EXIT_OPEN", "number",
                          "L:HJET_door_RearCargo_open", "number",
                          "L:HJET_door_front_cargo_open", "number", SYN_doors_FSX)                                               
fs2020_variable_subscribe("BRAKE PARKING INDICATOR", "bool", 
                          "L:HJET_HYD_TOTAL_QUANTIY_PCT", "number", SYN_misc_FSX)
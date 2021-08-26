$(document).ready(function () {
  HealthIndicator = new ProgressBar.Circle("#HealthIndicator", {
    color: "rgb(0, 182, 91)",
    trailColor: "#4a4a4a",
    strokeWidth: 12,
    trailWidth: 12,
    duration: 250,
    easing: "easeInOut",
  });

  ArmorIndicator = new ProgressBar.Circle("#ArmorIndicator", {
    color: "rgb(0,0,205)",
    trailColor: "#4a4a4a",
    strokeWidth: 12,
    trailWidth: 12,
    duration: 250,
    easing: "easeInOut",
  });

  HungerIndicator = new ProgressBar.Circle("#HungerIndicator", {
    color: "rgb(255, 164, 59)",
    trailColor: "#4a4a4a",
    strokeWidth: 12,
    trailWidth: 12,
    duration: 250,
    easing: "easeInOut",
  });

  ThirstIndicator = new ProgressBar.Circle("#ThirstIndicator", {
    color: "rgb(0, 140, 255)",
    trailColor: "#4a4a4a",
    strokeWidth: 12,
    trailWidth: 12,
    duration: 250,
    easing: "easeInOut",
  });

  StressIndicator = new ProgressBar.Circle("#StressIndicator", {
    color: "red",
    trailColor: "#4a4a4a",
    strokeWidth: 12,
    trailWidth: 12,
    duration: 250,
    easing: "easeInOut",
  });

  OxygenIndicator = new ProgressBar.Circle("#OxygenIndicator", {
    color: "rgb(0, 140, 255)",
    trailColor: "#4a4a4a",
    strokeWidth: 12,
    trailWidth: 12,
    duration: 250,
    easing: "easeInOut",
  });

  StaminaIndicator = new ProgressBar.Circle("#StaminaIndicator", {
    color: "#ADD8E6",
    trailColor: "#4a4a4a",
    strokeWidth: 12,
    trailWidth: 12,
    duration: 250,
    easing: "easeInOut",
  });

  Speedometer = new ProgressBar.Circle("#SpeedCircle", {
    color: "rgba(222, 222, 222, 1)",
    trailColor: "rgba(184, 184, 184, 0.082)",
    strokeWidth: 6,
    duration: 100,
    trailWidth: 6,
    easing: "easeInOut",
  });

  BeltCircle = new ProgressBar.Circle("#BeltCircle", {
    color: "#4a4a4a",
    trailColor: "#4a4a4a",
    strokeWidth: 10,
    duration: 100,
    trailWidth: 10,
    easing: "easeInOut",
  });

  FuelIndicator = new ProgressBar.Circle("#FuelCircle", {
    color: "rgba(222, 222, 222, 1)",
    trailColor: "rgba(184, 184, 184, 0.082)",
    strokeWidth: 6,
    duration: 100,
    trailWidth: 6,
    easing: "easeInOut",
  });

  VoiceIndicator = new ProgressBar.Circle("#VoiceIndicator", {
    color: "white",
    trailColor: "#4a4a4a",
    strokeWidth: 12,
    trailWidth: 12,
    duration: 250,
    easing: "easeInOut",
  });
  VoiceIndicator.animate(0.66);
});

window.addEventListener("message", function (event) {
  let data = event.data;

  if (data.action == "update_hud") {
    HealthIndicator.animate(data.hp / 100);
    ArmorIndicator.animate(data.armor / 100);
    HungerIndicator.animate(data.hunger / 100);
    ThirstIndicator.animate(data.thirst / 100);
    StressIndicator.animate(data.stress / 100);
    OxygenIndicator.animate(data.oxygen / 100);
    StaminaIndicator.animate(data.stamina / 100);
    BeltCircle.animate(1.0);
  }

  // Get current voice level and animate path
  if (data.action == "voice_level") {
    switch (data.voicelevel) {
      case 0:
        data.voicelevel = 33;
      break;
      case 1:
        data.voicelevel = 66;
      break;
      case 2:
        data.voicelevel = 100;
      break;
      default:
        data.voicelevel = 66;
      break;
    }
    VoiceIndicator.animate(data.voicelevel / 100);
  }

  // Light up path if talking
  if (data.talking == false) {
    VoiceIndicator.path.setAttribute("stroke", "white");
  } else if (data.talking == true) {
    VoiceIndicator.path.setAttribute("stroke", "yellow");
  }

  // Hide health if full
  if (data.showHealth == false) {
    $("#HealthIndicator").fadeOut();
  } else if (data.showHealth == true) {
    $("#HealthIndicator").fadeIn();
  }

  // Show oxygen if underwater
  if (data.showOxygen == true) {
    $("#OxygenIndicator").fadeIn();
  } else if (data.showOxygen == false) {
    $("#OxygenIndicator").fadeOut();
  }

  // Show stamina if sprinting
  if (data.showStamina == true) {
    $("#StaminaIndicator").show();
  } else if (data.showStamina == false) {
    $("#StaminaIndicator").hide();
  }

  // Hide armor if 0
  if (data.armor == 0) {
    $("#ArmorIndicator").fadeOut();
  } else if (data.armor > 0) {
    $("#ArmorIndicator").fadeIn();
  }

  // Hide stress if disabled
  if (data.showStress == false) {
    $("#StressIndicator").hide();
  } else if (data.showStress == true) {
    $("#StressIndicator").show();
  }

  // Hide fuel if disabled
  if (data.showFuel == true) {
    $("#FuelCircle").show();
  } else if (data.showFuel == false) {
    $("#FuelCircle").hide();
  }

  if (data.action == "update_fuel") {
    let finalfuel = (data.fuel / 100) * 1.5385;
    if (finalfuel > 0.9) {
      FuelIndicator.animate(1.0);
    } else {
      FuelIndicator.animate(finalfuel);
    }

    if (finalfuel < 0.2) {
      FuelIndicator.path.setAttribute("stoke", "red");
    } else {
      FuelIndicator.path.setAttribute("stoke", "white");
    }
  }

  // Change color and icon if HP is 0 (dead)
  if (data.hp < 0) {
    HealthIndicator.animate(0);
    HealthIndicator.trail.setAttribute("stroke", "red");
    $("#hp-icon").removeClass("fa-heart");
    $("#hp-icon").addClass("fa-skull");
  } else if (data.hp > 0) {
    HealthIndicator.trail.setAttribute("stroke", "#4a4a4a");
    $("#hp-icon").removeClass("fa-skull");
    $("#hp-icon").addClass("fa-heart");
  }

  // Flash if thirst is low
  if (data.thirst < 25) {
    $("#ThirstIcon").toggleClass("flash");
  }

  // Flash if hunger is low
  if (data.hunger < 25) {
    $("#HungerIcon").toggleClass("flash");
  }

  if (data.speed > 0) {
    $("#SpeedIndicator").text(data.speed);
    let multiplier = data.maxspeed * 0.1;
    let SpeedoLimit = data.maxspeed + multiplier;
    Speedometer.animate(data.speed / SpeedoLimit);
    Speedometer.path.setAttribute("stroke", "white");
  } else if (data.speed == 0) {
    $("#SpeedIndicator").text("0");
    Speedometer.path.setAttribute("stroke", "none");
  }

  if (data.showSpeedo == true) {
    $("#VehicleContainer").fadeIn();
  } else if (data.showSpeedo == false) {
    $("#VehicleContainer").fadeOut();
  }

  // Seatbelt section
  if (data.showBelt == true) {
    $("#BeltCircle").fadeIn();
  } else if (data.showBelt == true) {
    $("#BeltCircle").fadeOut();
  }

  if (data.isBeltOn == false) {
    $("#BeltCircle").toggleClass("pulse");
    BeltCircle.path.setAttribute("stroke", "#BF360C");
  } else if (data.isBeltOn == true){
    $("#BeltCircle").removeClass("pulse");
    BeltCircle.path.setAttribute("stroke", "#00CC00");
  }

  // Hide ui if pause menu is open
  if (data.showUi == false) {
    $(".container").hide();
  } else if (data.showUi == true) {
    $(".container").show();
  }

  // PlayerID
  if (data.pid == true) {
    document.getElementById("ServerID").innerHTML = data.playerid;
  } else if (data.pid == false) {
    $("#ID").hide()
  }

  // Seatbelt audio
  var audioPlayer = null;
  if (data.transactionType == "playSound") {
        
    if (audioPlayer != null) {
      audioPlayer.pause();
    }

    audioPlayer = new Audio("./sounds/" + data.transactionFile + ".ogg");
    audioPlayer.volume = data.transactionVolume;
    audioPlayer.play();
  }

});


# Kigali Self-Driving Car Simulation

A Python simulation of a self-driving car driving through Kigali from **ALU Rwanda** to the **Kigali Convention Centre**, complete with a live night-mode web view.

## How the Road Works

The road is a Python list where each item is a `100 m` section:

* **`"20"` to `"100"`** — Sets the speed limit ($\text{km/h}$)
* **`"zebra"`** — Stops the car for `15` seconds for pedestrians
* **`"bus"`** — Moves the car to the `LEFT` lane to pass a bus
* **`"road"`** — Normal road (keeps driving)

## Files in This Project

* `road_simulation.py` — Your vehicle logic and road setup
* `transit_program.py` — Runs the simulation loop, menu, and logging
* `engine.py` & `index.html` — Powers the web visualization
* `analyze_log.sh` — Bash script that summarizes your driving logs

## How to Run

1. Open your terminal in this project folder.
2. Run the program:
   ```bash
   python3 road_simulation.py
   ```
3. Type your driver name.
4. Use the menu to edit the road, or enter **`5`** to start driving.
5. Open the link shown in the terminal (e.g., `http://127.0.0.1:8008`) in your browser.
6. Return to the terminal and press **Enter** to start the car.

## Log Summary Script (Optional)

After running the simulation at least once, summarize `transit_session.log` with:

```bash
bash analyze_log.sh
```
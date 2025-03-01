# Expert Advisor (EA) Documentation: Pirate

## Overview
This Expert Advisor (EA) is designed for automated trading in the Forex market using MetaTrader 4 (MT4). It incorporates risk management, time-based trading, and technical indicators (RSI and Moving Average) for decision-making. Below is the documentation to help you understand and use the EA effectively.

---

## Features
- **Money Management**: Adjusts lot size based on account balance and risk percentage.
- **Time-Based Trading**: Operates within user-defined hours.
- **Technical Strategies**: Uses RSI and Moving Average for trade signals.
- **Spread Control**: Avoids trading during high spreads.
- **Multi-Currency Support**: Optimized for CHFJPY, EURCHF, EURAUD, USDCHF, USDCAD.
- **Risk Controls**: Stop Loss, Take Profit, and Trailing Stop options.

---

## Installation
1. **Copy Files**:
   - Place `Pirate.mq4` in the `MT4/MQL4/Experts/` directory.
   - Ensure sound files (`GOOD.wav`, `Monkey.wav`, etc.) are in `MT4/Sounds/`.

2. **Compile**:
   - Open MT4, navigate to **Navigator > Experts**, right-click `Pirate.mq4`, and select **Compile**.

3. **Attach to Chart**:
   - Drag the EA onto a chart of a supported currency pair.

---

## Configuration (Input Parameters)

### Money Management
| Parameter           | Description                                                                 | Default Value |
|---------------------|-----------------------------------------------------------------------------|---------------|
| `MoneyManagement`   | Enable dynamic lot sizing based on risk.                                    | `true`        |
| `Risk`              | Risk percentage per trade (e.g., 3 = 3% of balance).                       | `3`           |
| `OriginalLot`       | Fixed lot size if `MoneyManagement` is disabled.                           | `0.1`         |

### Trade Settings
| Parameter           | Description                                                                 | Default Value |
|---------------------|-----------------------------------------------------------------------------|---------------|
| `CountBuy`          | Maximum simultaneous buy orders. Use `-1` for unlimited.                   | `1`           |
| `CountSell`         | Maximum simultaneous sell orders. Use `-1` for unlimited.                  | `1`           |
| `TakeProfitClose`   | Close trades when profit reaches X pips.                                   | `5`           |
| `StopLoss`          | Stop Loss in pips.                                                         | `35`          |
| `TakeProfit`        | Take Profit in pips.                                                       | `20`          |
| `MaxSpreadOpen`     | Maximum allowed spread (in pips) to open a trade.                          | `30`          |

### Trading Hours
| Parameter           | Description                                                                 | Default Value |
|---------------------|-----------------------------------------------------------------------------|---------------|
| `StartHour`         | Start trading hour (0-23, server time).                                    | `0` (Midnight)|
| `StopHour`          | Stop trading hour (0-23, server time).                                     | `1` (1 AM)    |

### Display
| Parameter           | Description                                                                 | Default Value |
|---------------------|-----------------------------------------------------------------------------|---------------|
| `DisplayTable`      | Show info panel on the chart.                                              | `false`       |

---

## Strategy Details
### Entry Conditions
- **Buy Signal**:
  - RSI (14-period) < 30 and RSI (1-period) < 36.
  - Price above Moving Average (8-period, Median Price).
- **Sell Signal**:
  - RSI (14-period) > 70 and RSI (1-period) > 64.
  - Price below Moving Average (8-period, Median Price).

### Exit Conditions
- **Take Profit**: Closes at `TakeProfit` pips.
- **Stop Loss**: Triggers at `StopLoss` pips.
- **Time-Based Close**: Closes trades that exceed predefined idle times.

---

## Important Notes
- **Magic Number**: `181818` – Unique identifier for EA-managed trades.
- **Sound Alerts**: Requires `.wav` files in `MT4/Sounds/`.
- **Server Time**: EA uses broker/server time for trading hours.
- **Spread Protection**: Avoids trades if spread exceeds `MaxSpreadOpen`.

---

## Disclaimer
- This EA is provided "as is" with no warranties. Use at your own risk.
- Forex trading involves substantial risk; test thoroughly in a demo account before live use.
- The developers are not responsible for financial losses.

---

## Support
For updates and support, join the Telegram channel: [https://t.me/free_fx_pro](https://t.me/free_fx_pro).

---

**Note**: The code contains obfuscated variables (e.g., `总_1_bo`). For clarity, refer to the input parameters listed above.

/*
 * SPDX-FileCopyrightText: 2025 The LineageOS Project
 * SPDX-License-Identifier: Apache-2.0
 */

#pragma once

// <cmath> gets pulled in by libbase/fmt before the generated wifi HIDL
// headers, and its NAN macro collides with the RttPeerType::NAN and
// IfaceType::NAN enum members. Process math.h first (its include guard then
// prevents the macro from being redefined after the #undef below).
#include <math.h>
#undef NAN

// This pre-include is used by the rebuilt legacy wifi HIDL service, whose
// sources predate newer libwifi_hal enums (WIFI_CHAN_WIDTH_320,
// WIFI_RTT_PREAMBLE_EHT, WIFI_RTT_BW_320) and a few -Wreturn-type paths.
// The project builds with -Werror, so relax those diagnostics for the whole
// translation unit.
#pragma clang diagnostic ignored "-Wswitch"
#pragma clang diagnostic ignored "-Wreturn-type"

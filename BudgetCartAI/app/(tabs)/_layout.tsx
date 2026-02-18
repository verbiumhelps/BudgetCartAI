import React from "react";
import { Tabs } from "expo-router";
import { tokens } from "../../src/design/tokens";

export default function TabsLayout() {
  return (
    <Tabs
      screenOptions={{
        headerStyle: { backgroundColor: tokens.color.bg },
        headerTitleStyle: { color: tokens.color.text },
        tabBarStyle: { backgroundColor: tokens.color.bg, borderTopColor: "transparent" },
        tabBarActiveTintColor: tokens.color.accent,
        tabBarInactiveTintColor: tokens.color.muted,
      }}
    >
      <Tabs.Screen name="index" options={{ title: "Home" }} />
      <Tabs.Screen name="plan" options={{ title: "Plan" }} />
      <Tabs.Screen name="shop" options={{ title: "Shop" }} />
      <Tabs.Screen name="pantry" options={{ title: "Pantry" }} />
      <Tabs.Screen name="savings" options={{ title: "Savings" }} />
    </Tabs>
  );
}

import React from "react";
import { View, Text, Pressable, StyleSheet } from "react-native";
import { tokens } from "../design/tokens";

type Action = { id: string; label: string; onPress: () => void };

export function QuickActionsRow(props: { title?: string; actions: Action[] }) {
  return (
    <View>
      <Text style={styles.title}>{props.title ?? "Quick actions"}</Text>
      <View style={styles.row}>
        {props.actions.slice(0, 3).map((a) => (
          <Pressable key={a.id} style={styles.pill} onPress={a.onPress} accessibilityRole="button">
            <Text style={styles.pillText}>{a.label}</Text>
          </Pressable>
        ))}
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  title: { fontSize: tokens.type.small, color: tokens.color.muted, marginBottom: tokens.spacing.sm, fontWeight: "700" },
  row: { flexDirection: "row", gap: tokens.spacing.sm },
  pill: { paddingVertical: tokens.spacing.sm, paddingHorizontal: tokens.spacing.md, backgroundColor: tokens.color.surface2, borderWidth: 1, borderColor: tokens.color.border, borderRadius: tokens.radius.lg },
  pillText: { color: tokens.color.text, fontWeight: "700", fontSize: tokens.type.small },
});

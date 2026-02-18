import React, { useEffect } from "react";
import { View, Text, StyleSheet, ScrollView } from "react-native";
import { tokens } from "../../src/design/tokens";
import { PrimaryOptimizationCard } from "../../src/components/PrimaryOptimizationCard";
import { BudgetProgressRing } from "../../src/components/BudgetProgressRing";
import { QuickActionsRow } from "../../src/components/QuickActionsRow";
import { analytics } from "../../src/analytics";

export default function HomeScreen() {
  useEffect(() => { analytics.track({ name: "tab_viewed", props: { tab: "home" } }); }, []);

  return (
    <ScrollView style={styles.page} contentContainerStyle={styles.content}>
      <Text style={styles.h1}>This week</Text>

      <PrimaryOptimizationCard
        title="Lock your weekly grocery plan"
        description="Set a budget and priority items before you shop. You’ll see projected savings as you follow recommendations."
        hint="One primary action at a time; secondary insights stay collapsed."
        ctaLabel="Start plan"
        onPress={() => analytics.track({ name: "primary_cta_tapped", props: { screen: "home", cta: "start_plan" } })}
      />

      <View style={styles.section}>
        <Text style={styles.h2}>Budget snapshot</Text>
        <BudgetProgressRing spent={124} budget={220} />
      </View>

      <View style={styles.collapsed}>
        <Text style={styles.collapsedTitle}>Insights (collapsed)</Text>
        <Text style={styles.collapsedBody}>
          Coming soon: substitutions impact, store comparison, and waste risk — shown only as artifacts, never chat.
        </Text>
      </View>

      <View style={styles.section}>
        <QuickActionsRow
          actions={[
            { id: "qa1", label: "Start shop", onPress: () => analytics.track({ name: "primary_cta_tapped", props: { screen: "home", cta: "start_shop" } }) },
            { id: "qa2", label: "Add pantry item", onPress: () => analytics.track({ name: "primary_cta_tapped", props: { screen: "home", cta: "add_pantry_item" } }) },
            { id: "qa3", label: "View savings", onPress: () => analytics.track({ name: "primary_cta_tapped", props: { screen: "home", cta: "view_savings" } }) },
          ]}
        />
      </View>
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  page: { flex: 1, backgroundColor: tokens.color.bg },
  content: { padding: tokens.spacing.xl, gap: tokens.spacing.xl },
  h1: { fontSize: tokens.type.h1, color: tokens.color.text, fontWeight: "900" },
  h2: { fontSize: tokens.type.h2, color: tokens.color.text, fontWeight: "800", marginBottom: tokens.spacing.sm },
  section: { gap: tokens.spacing.sm },
  collapsed: { padding: tokens.spacing.lg, borderRadius: tokens.radius.lg, borderWidth: 1, borderColor: tokens.color.border, backgroundColor: tokens.color.surface2 },
  collapsedTitle: { color: tokens.color.text, fontWeight: "800" },
  collapsedBody: { marginTop: tokens.spacing.sm, color: tokens.color.muted, lineHeight: 20 },
});

export type AnalyticsEventName = "app_open" | "tab_viewed" | "primary_cta_tapped";

export type AnalyticsEvent =
  | { name: "app_open"; props?: { source?: "cold" | "warm" } }
  | { name: "tab_viewed"; props: { tab: "home" | "plan" | "shop" | "pantry" | "savings" } }
  | { name: "primary_cta_tapped"; props: { screen: string; cta: string } };

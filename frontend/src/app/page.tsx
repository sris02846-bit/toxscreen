"use client";

import { useState } from "react";
import { motion } from "framer-motion";
import { FlaskConical, Shield, Brain, ChevronRight, Zap } from "lucide-react";

export default function Home() {
  const [smiles, setSmiles] = useState("");

  return (
    <main className="min-h-screen">
      {/* Header */}
      <header className="border-b border-neutral-200 bg-white">
        <div className="mx-auto flex max-w-7xl items-center justify-between px-6 py-4">
          <div className="flex items-center gap-3">
            <div className="flex h-10 w-10 items-center justify-center rounded-lg bg-primary-600">
              <FlaskConical className="h-6 w-6 text-white" />
            </div>
            <div>
              <h1 className="text-xl font-bold text-neutral-900">ToxScreen</h1>
              <p className="text-xs text-neutral-500">AI Toxicology Platform</p>
            </div>
          </div>
          <nav className="hidden items-center gap-8 md:flex">
            <a href="#" className="text-sm text-neutral-600 hover:text-neutral-900">
              Platform
            </a>
            <a href="#" className="text-sm text-neutral-600 hover:text-neutral-900">
              Models
            </a>
            <a href="#" className="text-sm text-neutral-600 hover:text-neutral-900">
              Pricing
            </a>
            <a href="#" className="text-sm text-neutral-600 hover:text-neutral-900">
              Docs
            </a>
            <button className="rounded-lg bg-primary-600 px-4 py-2 text-sm font-medium text-white hover:bg-primary-700 transition-colors">
              Sign In
            </button>
          </nav>
        </div>
      </header>

      {/* Hero Section */}
      <section className="relative overflow-hidden bg-white px-6 py-24">
        <div className="absolute inset-0 bg-gradient-to-br from-primary-50 via-white to-accent-50" />
        <div className="relative mx-auto max-w-7xl">
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.6 }}
            className="mx-auto max-w-3xl text-center"
          >
            <div className="mb-6 inline-flex items-center gap-2 rounded-full border border-primary-200 bg-primary-50 px-4 py-2">
              <Zap className="h-4 w-4 text-primary-600" />
              <span className="text-xs font-medium text-primary-700">
                v1.0 Now Available
              </span>
            </div>
            <h2 className="mb-6 text-5xl font-bold tracking-tight text-neutral-900">
              Predict Toxicity{" "}
              <span className="bg-gradient-to-r from-primary-600 to-accent-500 bg-clip-text text-transparent">
                Before Synthesis
              </span>
            </h2>
            <p className="mb-10 text-lg text-neutral-600 leading-relaxed">
              Next-generation AI platform that combines trusted scientific databases
              with machine learning to predict drug toxicity. Save millions in
              late-stage failures.
            </p>
            <div className="mx-auto max-w-xl">
              <div className="flex gap-2">
                <input
                  type="text"
                  value={smiles}
                  onChange={(e) => setSmiles(e.target.value)}
                  placeholder="Enter SMILES (e.g., CC(=O)Oc1ccccc1C(=O)O)"
                  className="flex-1 rounded-lg border border-neutral-300 px-4 py-3 text-sm font-mono focus:border-primary-500 focus:ring-2 focus:ring-primary-200 outline-none transition-all"
                />
                <button className="rounded-lg bg-primary-600 px-6 py-3 text-sm font-medium text-white hover:bg-primary-700 transition-colors flex items-center gap-2">
                  Analyze <ChevronRight className="h-4 w-4" />
                </button>
              </div>
            </div>
          </motion.div>
        </div>
      </section>

      {/* Features Grid */}
      <section className="px-6 py-20 bg-neutral-50">
        <div className="mx-auto max-w-7xl">
          <div className="mb-12 text-center">
            <h3 className="text-3xl font-bold text-neutral-900 mb-4">
              Information First. Intelligence Second.
            </h3>
            <p className="text-neutral-600">
              Every prediction backed by verified scientific evidence
            </p>
          </div>
          <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
            {features.map((feature, i) => (
              <motion.div
                key={feature.title}
                initial={{ opacity: 0, y: 20 }}
                animate={{ opacity: 1, y: 0 }}
                transition={{ delay: 0.2 + i * 0.1 }}
                className="rounded-xl border border-neutral-200 bg-white p-6 shadow-card hover:shadow-card-hover transition-shadow"
              >
                <div className="mb-4 flex h-12 w-12 items-center justify-center rounded-lg bg-primary-100">
                  {feature.icon}
                </div>
                <h4 className="mb-2 font-semibold text-neutral-900">
                  {feature.title}
                </h4>
                <p className="text-sm text-neutral-600">{feature.description}</p>
              </motion.div>
            ))}
          </div>
        </div>
      </section>

      {/* Footer */}
      <footer className="border-t border-neutral-200 bg-white px-6 py-8">
        <div className="mx-auto max-w-7xl text-center">
          <p className="text-sm text-neutral-500">
            © 2026 ToxScreen. All rights reserved.
          </p>
        </div>
      </footer>
    </main>
  );
}

const features = [
  {
    title: "Source-First Architecture",
    description:
      "Every prediction begins with evidence from 11+ trusted scientific databases including PubChem, ChEMBL, and FDA sources.",
    icon: <FlaskConical className="h-6 w-6 text-primary-600" />,
  },
  {
    title: "AI-Powered Predictions",
    description:
      "Ensemble machine learning models with calibrated probabilities, confidence scores, and full explainability.",
    icon: <Brain className="h-6 w-6 text-primary-600" />,
  },
  {
    title: "Regulatory Ready",
    description:
      "ICH M7 compliant, OECD QSAR principles, GxP audit trails, and FDA qualification roadmap built in.",
    icon: <Shield className="h-6 w-6 text-primary-600" />,
  },
];

import type { Metadata } from "next";
import { Inter } from "next/font/google";
import "./globals.css";

const inter = Inter({
  subsets: ["latin"],
  display: "swap",
  variable: "--font-inter",
});

export const metadata: Metadata = {
  title: "ToxScreen - AI-Driven Toxicology Platform",
  description:
    "Next-generation scientific intelligence platform for toxicity prediction. Source-First Architecture with compound intelligence profiles.",
  keywords: [
    "toxicology",
    "AI",
    "drug discovery",
    "toxicity prediction",
    "in silico",
  ],
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en" className={inter.variable}>
      <body className="min-h-screen bg-neutral-50 font-sans text-neutral-900 antialiased">
        {children}
      </body>
    </html>
  );
}

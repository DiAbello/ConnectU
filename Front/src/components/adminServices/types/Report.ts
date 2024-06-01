import type { User } from "@/types/User";

export interface Report {
    id: number,
    report_sender: User,
    report_offending: User,
    content: string,
    timestamp: string
}
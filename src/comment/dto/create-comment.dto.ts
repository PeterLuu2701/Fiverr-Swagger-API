import { ApiProperty } from "@nestjs/swagger"

export class CreateCommentDto {
    @ApiProperty()
    job_id: number

    @ApiProperty()
    user_id: number

    @ApiProperty()
    comment_date: Date

    @ApiProperty()
    content: string

    @ApiProperty()
    comment_star: number
}

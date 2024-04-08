import { ApiProperty, PartialType } from '@nestjs/swagger';
import { CreateCommentDto } from './create-comment.dto';

export class UpdateCommentDto {
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

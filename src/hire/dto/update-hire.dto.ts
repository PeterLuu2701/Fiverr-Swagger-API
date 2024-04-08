import { ApiProperty, PartialType } from '@nestjs/swagger';

export class UpdateHireDto {
    @ApiProperty()
    job_id: number

    @ApiProperty()
    user_id: number

    @ApiProperty()
    hire_date: Date

    @ApiProperty()
    complete: boolean
}

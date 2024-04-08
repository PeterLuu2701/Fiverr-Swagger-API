import { ApiProperty } from "@nestjs/swagger"

export class CreateHireDto {
    @ApiProperty()
    job_id: number

    @ApiProperty()
    user_id: number

    @ApiProperty()
    hire_date: Date

    @ApiProperty()
    complete: boolean
}
